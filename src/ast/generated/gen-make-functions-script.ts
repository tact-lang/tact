import generate from "@babel/generator";
import type { ParserOptions } from "@babel/parser";
import { parse } from "@babel/parser";
import * as t from "@babel/types";
import * as fs from "fs";
import * as path from "path";

function main() {
    const options: ParserOptions = {
        sourceType: "module",
        plugins: ["typescript"],
    };

    const astModule = fs
        .readFileSync(path.join(__dirname, "..", "ast.ts"))
        .toString();
    const astTypeDecls = parse(astModule, options);
    const decls = astTypeDecls.program.body
        .filter((stmt) => stmt.type === "ExportNamedDeclaration")
        .map((stmt) => stmt.declaration)
        .filter((stmt) => stmt?.type === "TSTypeAliasDeclaration");

    const declNames = new Set(decls.map((decl) => decl.id.name));

    const finalFunctions: { name: string; code: string }[] = [];

    // Extract from the declarations all the union types
    const unionTypes = decls
        .map((decl) => decl.typeAnnotation)
        .filter((decl) => decl.type === "TSUnionType");

    for (const unionType of unionTypes) {
        const subtypes = unionType.types
            .filter((typeDecl) => typeDecl.type === "TSTypeReference")
            .map((typeDecl) => typeDecl.typeName)
            .filter((typeDecl) => typeDecl.type === "Identifier");

        for (const subtype of subtypes) {
            const subtypeDecl = decls.find(
                (decl) => decl.id.name === subtype.name,
            );
            if (typeof subtypeDecl === "undefined") {
                throw new Error(`${subtype.name} is not declared.`);
            }

            const subtypeDeclType = subtypeDecl.typeAnnotation.type;
            if (subtypeDeclType === "TSTypeLiteral") {
                const genFunctions = createMakeAndDummyFunctions(
                    subtypeDecl.typeAnnotation,
                    subtypeDecl.id,
                    declNames,
                );
                const genFunctionsFiltered = genFunctions.filter((genF) =>
                    finalFunctions.every((f) => f.name !== genF.name),
                );

                if (genFunctionsFiltered.length > 0) {
                    console.log(
                        `Generated [${genFunctionsFiltered.map((entry) => entry.name).join(", ")}] for ${subtype.name}`,
                    );
                }

                finalFunctions.push(...genFunctionsFiltered);
            } else if (subtypeDeclType === "TSUnionType") {
                // Do nothing, since it will be processed later.
            } else {
                // Unexpected type
                throw new Error(
                    `${subtype.name} is not a reference to a type literal or a union type.`,
                );
            }
        }
    }

    // Create the make factory file
    const makeFactoryTemplate = fs
        .readFileSync(path.join(__dirname, "make-factory.template"))
        .toString();

    const functionCodes = finalFunctions
        .map((genFun) => genFun.code)
        .join("\n\n");
    const functionNames = finalFunctions
        .map((genFun) => genFun.name)
        .join(",\n");

    const makeFactoryCode = makeFactoryTemplate
        .replace("<FUNCTIONS>", functionCodes)
        .replace("<FUNCTION_NAMES>", functionNames);

    fs.writeFileSync(path.join(__dirname, "make-factory.ts"), makeFactoryCode);

    console.log("Finished.");
}

function createMakeAndDummyFunctions(
    decl: t.TSTypeLiteral,
    id: t.Identifier,
    decls: Set<string>,
): { name: string; code: string }[] {
    const astNamespace = "Ast";
    const astFactoryObject = "astF";
    const createNodeFunName = "createNode";
    const emptySrcInfo = "emptySrcInfo";

    const rawFieldsArray = decl.members.filter(
        (decl) => decl.type === "TSPropertySignature",
    );
    const generalParams: { id: t.Identifier; type: t.TSType }[] = [];
    const paramsWithLiteralTypes: {
        id: t.Identifier;
        type: t.TSLiteralType;
    }[] = [];

    // If there is no loc field,
    // the makeDummy function cannot be created
    const makeDummy = rawFieldsArray.some(
        (f) => f.key.type === "Identifier" && f.key.name === "loc",
    );

    for (const field of rawFieldsArray) {
        if (field.key.type !== "Identifier") {
            throw new Error(
                `Expected identifier in fields, but found ${field.key.type}`,
            );
        }
        const fieldName = field.key.name;
        if (fieldName === "id") {
            // The id field should not occur as an argument to the function,
            // nor as a parameter to createNode
            continue;
        }
        if (field.typeAnnotation) {
            const typeAnnotation = field.typeAnnotation.typeAnnotation;
            if (typeAnnotation.type === "TSLiteralType") {
                paramsWithLiteralTypes.push({
                    id: field.key,
                    type: typeAnnotation,
                });
            } else {
                generalParams.push({ id: field.key, type: typeAnnotation });
            }
        } else {
            throw new Error(
                `Expected field ${fieldName} to have a type annotation`,
            );
        }
    }

    const makeFunName = `make${id.name}`;
    const makeDummyFunName = `makeDummy${id.name}`;
    // The params to the make functions do not have fields with literal types
    // Also, the dummy function needs to filter the loc parameter
    const createParam = (entry: { id: t.Identifier; type: t.TSType }) => {
        const newId = t.identifier(`p_${entry.id.name}`);
        newId.typeAnnotation = t.tsTypeAnnotation(
            qualifyType(astNamespace, entry.type, decls),
        );
        return newId;
    };
    const makeFunParamsArray = generalParams.map((entry) => createParam(entry));
    const makeDummyFunParamsArray = generalParams
        .filter(({ id, type: _ }) => id.name !== "loc")
        .map((entry) => createParam(entry));

    // The arguments with literal values to the createNode call inside the make functions body
    const createNodeLiteralArgs = paramsWithLiteralTypes.map(({ id, type }) =>
        t.objectProperty(id, type.literal),
    );
    // The non-literal arguments to the createNode call inside the make functions body
    const createNodeArgsForMake = generalParams.map(({ id, type: _ }) =>
        t.objectProperty(id, t.identifier(`p_${id.name}`)),
    );
    const createNodeArgsForMakeDummy = generalParams.map(({ id, type: _ }) =>
        id.name === "loc"
            ? t.objectProperty(id, t.identifier(emptySrcInfo))
            : t.objectProperty(id, t.identifier(`p_${id.name}`)),
    );
    const funReturnType = t.tsTypeReference(
        t.tsQualifiedName(t.identifier(astNamespace), id),
    );
    // Function to create the function codes
    const createFun = (
        name: string,
        params: t.Identifier[],
        createNodeArgs: t.ObjectProperty[],
    ) => {
        const body = t.returnStatement(
            t.tsAsExpression(
                t.callExpression(
                    t.memberExpression(
                        t.identifier(astFactoryObject),
                        t.identifier(createNodeFunName),
                    ),
                    [t.objectExpression(createNodeArgs)],
                ),
                funReturnType,
            ),
        );
        const funDecl = t.functionDeclaration(
            t.identifier(name),
            params,
            t.blockStatement([body]),
        );
        funDecl.returnType = t.tsTypeAnnotation(funReturnType);
        return funDecl;
    };

    const makeFun = createFun(makeFunName, makeFunParamsArray, [
        ...createNodeLiteralArgs,
        ...createNodeArgsForMake,
    ]);
    const makeDummyFun = createFun(makeDummyFunName, makeDummyFunParamsArray, [
        ...createNodeLiteralArgs,
        ...createNodeArgsForMakeDummy,
    ]);

    if (makeDummy) {
        return [
            { name: makeFunName, code: generate(makeFun).code },
            { name: makeDummyFunName, code: generate(makeDummyFun).code },
        ];
    } else {
        console.log(
            `[WARNING] Skipped makeDummy for ${id.name}, because there is no loc field in ${id.name}.`,
        );
        return [{ name: makeFunName, code: generate(makeFun).code }];
    }
}

function qualifyType(
    namespace: string,
    typ: t.TSType,
    decls: Set<string>,
): t.TSType {
    switch (typ.type) {
        case "TSTypeReference": {
            if (typ.typeName.type === "Identifier") {
                if (decls.has(typ.typeName.name)) {
                    return t.tsTypeReference(
                        t.tsQualifiedName(
                            t.identifier(namespace),
                            typ.typeName,
                        ),
                    );
                } else {
                    // Leave the identifier unchanged, but check if it has type parameters
                    const typRef = t.tsTypeReference(typ.typeName);
                    if (typ.typeParameters) {
                        typRef.typeParameters = t.tsTypeParameterInstantiation(
                            typ.typeParameters.params.map((t) =>
                                qualifyType(namespace, t, decls),
                            ),
                        );
                    }
                    return typRef;
                }
            }
            // Leave the type as is
            return typ;
        }
        case "TSUnionType": {
            return t.tsUnionType(
                typ.types.map((t) => qualifyType(namespace, t, decls)),
            );
        }
        case "TSArrayType": {
            return t.tsArrayType(
                qualifyType(namespace, typ.elementType, decls),
            );
        }
        case "TSTypeOperator": {
            const op = t.tsTypeOperator(
                qualifyType(namespace, typ.typeAnnotation, decls),
            );
            op.operator = typ.operator;
            return op;
        }
        case "TSTupleType": {
            if (
                typ.elementTypes.every((t) => t.type !== "TSNamedTupleMember")
            ) {
                return t.tsTupleType(
                    typ.elementTypes.map((t) =>
                        qualifyType(namespace, t, decls),
                    ),
                );
            } else {
                // Currently unsupported
                throw new Error(
                    "TSNamedTupleMember is currently not supported in TSTupleType",
                );
            }
        }

        default:
            return typ;
    }
}

main();
