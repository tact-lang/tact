/* eslint-disable @typescript-eslint/no-namespace */
/* eslint-disable @typescript-eslint/ban-types */
/* eslint-disable @typescript-eslint/no-redundant-type-constituents */
/* eslint-disable @typescript-eslint/no-duplicate-type-constituents */
import * as $ from "@langtools/runtime";
export namespace $ast {
  export type Module = $.Located<{
    readonly $: "Module";
    readonly imports: readonly Import[];
    readonly items: readonly moduleItem[];
  }>;
  export type Import = $.Located<{
    readonly $: "Import";
    readonly path: StringLiteral;
  }>;
  export type PrimitiveTypeDecl = $.Located<{
    readonly $: "PrimitiveTypeDecl";
    readonly name: TypeId;
  }>;
  export type $Function = $.Located<{
    readonly $: "Function";
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly parameters: parametersFormal;
    readonly returnType: ascription | undefined;
    readonly body: FunctionDefinition | FunctionDeclaration;
  }>;
  export type AsmFunction = $.Located<{
    readonly $: "AsmFunction";
    readonly shuffle: shuffle | undefined;
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly parameters: parametersFormal;
    readonly returnType: ascription | undefined;
    readonly instructions: string;
  }>;
  export type NativeFunctionDecl = $.Located<{
    readonly $: "NativeFunctionDecl";
    readonly nativeName: FuncId;
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly parameters: parametersFormal;
    readonly returnType: ascription | undefined;
  }>;
  export type Constant = $.Located<{
    readonly $: "Constant";
    readonly attributes: readonly ConstantAttribute[];
    readonly name: Id;
    readonly type: ascription;
    readonly body: ConstantDefinition | ConstantDeclaration;
  }>;
  export type StructDecl = $.Located<{
    readonly $: "StructDecl";
    readonly name: TypeId;
    readonly fields: structFields;
  }>;
  export type MessageDecl = $.Located<{
    readonly $: "MessageDecl";
    readonly opcode: IntegerLiteral | undefined;
    readonly name: TypeId;
    readonly fields: structFields;
  }>;
  export type Contract = $.Located<{
    readonly $: "Contract";
    readonly attributes: readonly ContractAttribute[];
    readonly name: Id;
    readonly traits: inheritedTraits | undefined;
    readonly declarations: readonly contractItemDecl[];
  }>;
  export type Trait = $.Located<{
    readonly $: "Trait";
    readonly attributes: readonly ContractAttribute[];
    readonly name: Id;
    readonly traits: inheritedTraits | undefined;
    readonly declarations: readonly traitItemDecl[];
  }>;
  export type moduleItem = PrimitiveTypeDecl | $Function | AsmFunction | NativeFunctionDecl | Constant | StructDecl | MessageDecl | Contract | Trait;
  export type ContractInit = $.Located<{
    readonly $: "ContractInit";
    readonly parameters: parametersFormal;
    readonly body: statements;
  }>;
  export type Receiver = $.Located<{
    readonly $: "Receiver";
    readonly type: receiverType;
    readonly param: receiverParam;
    readonly body: statements;
  }>;
  export type FieldDecl = $.Located<{
    readonly $: "FieldDecl";
    readonly name: Id;
    readonly type: ascription;
    readonly as: asType | undefined;
    readonly expression: expression | undefined;
  }>;
  export type semicolon = ";" | "}";
  export type storageVar = FieldDecl;
  export type contractItemDecl = ContractInit | Receiver | $Function | Constant | storageVar;
  export type traitItemDecl = Receiver | $Function | Constant | storageVar;
  export type FunctionDefinition = $.Located<{
    readonly $: "FunctionDefinition";
    readonly body: statements;
  }>;
  export type FunctionDeclaration = $.Located<{
    readonly $: "FunctionDeclaration";
  }>;
  export type Id = $.Located<{
    readonly $: "Id";
    readonly name: string;
  }>;
  export type IntegerLiteralDec = $.Located<{
    readonly $: "IntegerLiteralDec";
    readonly digits: string;
  }>;
  export type shuffle = {
    readonly ids: readonly Id[];
    readonly to: readonly IntegerLiteralDec[] | undefined;
  };
  export type ConstantAttribute = $.Located<{
    readonly $: "ConstantAttribute";
    readonly name: keyword<"virtual"> | keyword<"override"> | keyword<"abstract">;
  }>;
  export type ConstantDefinition = $.Located<{
    readonly $: "ConstantDefinition";
    readonly expression: expression;
  }>;
  export type ConstantDeclaration = $.Located<{
    readonly $: "ConstantDeclaration";
  }>;
  export type inter<A, B> = {
    readonly head: A;
    readonly tail: readonly {
      readonly op: B;
      readonly right: A;
    }[];
  };
  export type structFields = inter<FieldDecl, ";"> | undefined;
  export type keyword<T> = T;
  export type inheritedTraits = inter<Id, ",">;
  export type ContractAttribute = $.Located<{
    readonly $: "ContractAttribute";
    readonly name: StringLiteral;
  }>;
  export type FunctionAttribute = $.Located<{
    readonly $: "FunctionAttribute";
    readonly name: GetAttribute | keyword<"mutates"> | keyword<"extends"> | keyword<"virtual"> | keyword<"override"> | keyword<"inline"> | keyword<"abstract">;
  }>;
  export type GetAttribute = $.Located<{
    readonly $: "GetAttribute";
    readonly methodId: expression | undefined;
  }>;
  export type receiverType = "bounced" | keyword<"receive"> | keyword<"external">;
  export type Parameter = $.Located<{
    readonly $: "Parameter";
    readonly name: Id;
    readonly type: ascription;
  }>;
  export type StringLiteral = $.Located<{
    readonly $: "StringLiteral";
    readonly value: string;
  }>;
  export type receiverParam = Parameter | StringLiteral | undefined;
  export type multiLineComment = string;
  export type singleLineComment = string;
  export type comment = multiLineComment | singleLineComment;
  export type assemblyTerm = {} | comment | {} | readonly {}[];
  export type assembly = readonly assemblyTerm[];
  export type TypeOptional = $.Located<{
    readonly $: "TypeOptional";
    readonly child: TypeId;
  }>;
  export type TypeRegular = $.Located<{
    readonly $: "TypeRegular";
    readonly child: TypeId;
  }>;
  export type TypeMap = $.Located<{
    readonly $: "TypeMap";
    readonly key: TypeId;
    readonly keyAs: asType | undefined;
    readonly value: TypeId;
    readonly valueAs: asType | undefined;
  }>;
  export type TypeBounced = $.Located<{
    readonly $: "TypeBounced";
    readonly child: TypeId;
  }>;
  export type $type = TypeOptional | TypeRegular | TypeMap | TypeBounced;
  export type ascription = $type;
  export type TypeId = $.Located<{
    readonly $: "TypeId";
    readonly name: string;
  }>;
  export type asType = Id;
  export type StatementLet = $.Located<{
    readonly $: "StatementLet";
    readonly name: Id;
    readonly type: ascription | undefined;
    readonly init: expression;
  }>;
  export type StatementBlock = $.Located<{
    readonly $: "StatementBlock";
    readonly body: statements;
  }>;
  export type StatementReturn = $.Located<{
    readonly $: "StatementReturn";
    readonly expression: expression | undefined;
  }>;
  export type StatementCondition = $.Located<{
    readonly $: "StatementCondition";
    readonly condition: expression;
    readonly trueBranch: statements;
    readonly falseBranch: FalseBranch | StatementCondition | undefined;
  }>;
  export type StatementWhile = $.Located<{
    readonly $: "StatementWhile";
    readonly condition: parens;
    readonly body: statements;
  }>;
  export type StatementRepeat = $.Located<{
    readonly $: "StatementRepeat";
    readonly condition: parens;
    readonly body: statements;
  }>;
  export type StatementUntil = $.Located<{
    readonly $: "StatementUntil";
    readonly body: statements;
    readonly condition: parens;
  }>;
  export type StatementTry = $.Located<{
    readonly $: "StatementTry";
    readonly body: statements;
    readonly handler: {
      readonly name: Id;
      readonly body: statements;
    } | undefined;
  }>;
  export type StatementForEach = $.Located<{
    readonly $: "StatementForEach";
    readonly key: Id;
    readonly value: Id;
    readonly expression: expression;
    readonly body: statements;
  }>;
  export type StatementExpression = $.Located<{
    readonly $: "StatementExpression";
    readonly expression: expression;
  }>;
  export type StatementAssign = $.Located<{
    readonly $: "StatementAssign";
    readonly left: expression;
    readonly operator: augmentedOp | undefined;
    readonly right: expression;
  }>;
  export type statement = StatementLet | StatementBlock | StatementReturn | StatementCondition | StatementWhile | StatementRepeat | StatementUntil | StatementTry | StatementForEach | StatementExpression | StatementAssign;
  export type statements = readonly statement[];
  export type augmentedOp = "||" | "&&" | ">>" | "<<" | "-" | "+" | "*" | "/" | "%" | "|" | "&" | "^";
  export type FalseBranch = $.Located<{
    readonly $: "FalseBranch";
    readonly body: statements;
  }>;
  export type Conditional = $.Located<{
    readonly $: "Conditional";
    readonly head: or;
    readonly tail: {
      readonly thenBranch: or;
      readonly elseBranch: Conditional;
    } | undefined;
  }>;
  export type expression = Conditional;
  export type Binary<T, U> = $.Located<{
    readonly $: "Binary";
    readonly exprs: inter<T, Operator<U>>;
  }>;
  export type Unary = $.Located<{
    readonly $: "Unary";
    readonly prefixes: readonly Operator<"-" | "+" | "!" | "~">[];
    readonly expression: Suffix;
  }>;
  export type mul = Binary<Unary, "*" | "/" | "%">;
  export type add = Binary<mul, "+" | "-">;
  export type bitwiseShift = Binary<add, "<<" | ">>">;
  export type compare = Binary<bitwiseShift, "<=" | "<" | ">=" | ">">;
  export type equality = Binary<compare, "!=" | "==">;
  export type bitwiseAnd = Binary<equality, "&">;
  export type bitwiseXor = Binary<bitwiseAnd, "^">;
  export type bitwiseOr = Binary<bitwiseXor, "|">;
  export type and = Binary<bitwiseOr, "&&">;
  export type or = Binary<and, "||">;
  export type Suffix = $.Located<{
    readonly $: "Suffix";
    readonly expression: primary;
    readonly suffixes: readonly suffix[];
  }>;
  export type Operator<U> = $.Located<{
    readonly $: "Operator";
    readonly name: U;
  }>;
  export type SuffixUnboxNotNull = $.Located<{
    readonly $: "SuffixUnboxNotNull";
  }>;
  export type SuffixCall = $.Located<{
    readonly $: "SuffixCall";
    readonly params: parametersPassed;
  }>;
  export type SuffixFieldAccess = $.Located<{
    readonly $: "SuffixFieldAccess";
    readonly name: Id;
  }>;
  export type suffix = SuffixUnboxNotNull | SuffixCall | SuffixFieldAccess;
  export type Parens = $.Located<{
    readonly $: "Parens";
    readonly child: parens;
  }>;
  export type StructInstance = $.Located<{
    readonly $: "StructInstance";
    readonly type: TypeId;
    readonly fields: inter<StructFieldInitializer, ","> | undefined;
  }>;
  export type IntegerLiteral = $.Located<{
    readonly $: "IntegerLiteral";
    readonly value: IntegerLiteralHex | IntegerLiteralBin | IntegerLiteralOct | IntegerLiteralDec;
  }>;
  export type BoolLiteral = $.Located<{
    readonly $: "BoolLiteral";
    readonly value: "true" | "false";
  }>;
  export type InitOf = $.Located<{
    readonly $: "InitOf";
    readonly name: Id;
    readonly params: parametersPassed;
  }>;
  export type Null = $.Located<{
    readonly $: "Null";
  }>;
  export type primary = Parens | StructInstance | IntegerLiteral | BoolLiteral | InitOf | Null | StringLiteral | Id;
  export type parens = expression;
  export type StructFieldInitializer = $.Located<{
    readonly $: "StructFieldInitializer";
    readonly name: Id;
    readonly init: expression | undefined;
  }>;
  export type parametersPassed = inter<expression, ","> | undefined;
  export type parametersFormal = inter<Parameter, ","> | undefined;
  export type IntegerLiteralHex = $.Located<{
    readonly $: "IntegerLiteralHex";
    readonly digits: string;
  }>;
  export type IntegerLiteralBin = $.Located<{
    readonly $: "IntegerLiteralBin";
    readonly digits: string;
  }>;
  export type IntegerLiteralOct = $.Located<{
    readonly $: "IntegerLiteralOct";
    readonly digits: string;
  }>;
  export type idPart = string | string | "_";
  export type digit = string;
  export type hexDigit = string | string;
  export type whiteSpace = " " | "\t" | "\r" | "\n";
  export type funcPlainId = {};
  export type funcQuotedId = {};
  export type FuncId = $.Located<{
    readonly $: "FuncId";
    readonly accessor: "." | "~" | undefined;
    readonly id: string;
  }>;
  export type escapeChar = "\\" | "\"" | "n" | "r" | "t" | "v" | "b" | "f" | string | string | string;
  export type reservedWord = keyword<"extend" | "public" | "fun" | "let" | "return" | "receive" | "native" | "primitive" | "null" | "if" | "else" | "while" | "repeat" | "do" | "until" | "try" | "catch" | "foreach" | "as" | "map" | "mutates" | "extends" | "external" | "import" | "with" | "trait" | "initOf" | "override" | "abstract" | "virtual" | "inline" | "const">;
  export type space = " " | "\t" | "\r" | "\n" | comment;
  export type JustImports = $.Located<{
    readonly $: "JustImports";
    readonly imports: readonly Import[];
  }>;
}
export const Module: $.Parser<$ast.Module> = $.loc($.field($.pure("Module"), "$", $.right($.star($.ref(() => space)), $.field($.star($.ref(() => Import)), "imports", $.field($.star($.ref(() => moduleItem)), "items", $.right($.lookNeg($.any), $.eps))))));
export const Import: $.Parser<$ast.Import> = $.loc($.field($.pure("Import"), "$", $.right($.ref(() => keyword($.str("import"))), $.field($.ref(() => StringLiteral), "path", $.right($.str(";"), $.eps)))));
export const PrimitiveTypeDecl: $.Parser<$ast.PrimitiveTypeDecl> = $.loc($.field($.pure("PrimitiveTypeDecl"), "$", $.right($.ref(() => keyword($.str("primitive"))), $.field($.ref(() => TypeId), "name", $.right($.str(";"), $.eps)))));
export const $Function: $.Parser<$ast.$Function> = $.loc($.field($.pure("Function"), "$", $.field($.star($.ref(() => FunctionAttribute)), "attributes", $.right($.ref(() => keyword($.str("fun"))), $.field($.ref(() => Id), "name", $.field($.ref(() => parametersFormal), "parameters", $.field($.opt($.ref(() => ascription)), "returnType", $.field($.alt($.ref(() => FunctionDefinition), $.ref(() => FunctionDeclaration)), "body", $.eps))))))));
export const AsmFunction: $.Parser<$ast.AsmFunction> = $.loc($.field($.pure("AsmFunction"), "$", $.right($.str("asm"), $.field($.opt($.ref(() => shuffle)), "shuffle", $.field($.star($.ref(() => FunctionAttribute)), "attributes", $.right($.ref(() => keyword($.str("fun"))), $.field($.ref(() => Id), "name", $.field($.ref(() => parametersFormal), "parameters", $.field($.opt($.ref(() => ascription)), "returnType", $.right($.str("{"), $.field($.lex($.stry($.ref(() => assembly))), "instructions", $.right($.str("}"), $.eps))))))))))));
export const NativeFunctionDecl: $.Parser<$ast.NativeFunctionDecl> = $.loc($.field($.pure("NativeFunctionDecl"), "$", $.right($.str("@name"), $.right($.str("("), $.field($.ref(() => FuncId), "nativeName", $.right($.str(")"), $.field($.star($.ref(() => FunctionAttribute)), "attributes", $.right($.ref(() => keyword($.str("native"))), $.field($.ref(() => Id), "name", $.field($.ref(() => parametersFormal), "parameters", $.field($.opt($.ref(() => ascription)), "returnType", $.right($.str(";"), $.eps))))))))))));
export const Constant: $.Parser<$ast.Constant> = $.loc($.field($.pure("Constant"), "$", $.field($.star($.ref(() => ConstantAttribute)), "attributes", $.right($.ref(() => keyword($.str("const"))), $.field($.ref(() => Id), "name", $.field($.ref(() => ascription), "type", $.field($.alt($.ref(() => ConstantDefinition), $.ref(() => ConstantDeclaration)), "body", $.eps)))))));
export const StructDecl: $.Parser<$ast.StructDecl> = $.loc($.field($.pure("StructDecl"), "$", $.right($.str("struct"), $.field($.ref(() => TypeId), "name", $.right($.str("{"), $.field($.ref(() => structFields), "fields", $.right($.str("}"), $.eps)))))));
export const MessageDecl: $.Parser<$ast.MessageDecl> = $.loc($.field($.pure("MessageDecl"), "$", $.right($.str("message"), $.field($.opt($.right($.str("("), $.left($.ref(() => IntegerLiteral), $.str(")")))), "opcode", $.field($.ref(() => TypeId), "name", $.right($.str("{"), $.field($.ref(() => structFields), "fields", $.right($.str("}"), $.eps))))))));
export const Contract: $.Parser<$ast.Contract> = $.loc($.field($.pure("Contract"), "$", $.field($.star($.ref(() => ContractAttribute)), "attributes", $.right($.ref(() => keyword($.str("contract"))), $.field($.ref(() => Id), "name", $.field($.opt($.ref(() => inheritedTraits)), "traits", $.right($.str("{"), $.field($.star($.ref(() => contractItemDecl)), "declarations", $.right($.str("}"), $.eps)))))))));
export const Trait: $.Parser<$ast.Trait> = $.loc($.field($.pure("Trait"), "$", $.field($.star($.ref(() => ContractAttribute)), "attributes", $.right($.ref(() => keyword($.str("trait"))), $.field($.ref(() => Id), "name", $.field($.opt($.ref(() => inheritedTraits)), "traits", $.right($.str("{"), $.field($.star($.ref(() => traitItemDecl)), "declarations", $.right($.str("}"), $.eps)))))))));
export const moduleItem: $.Parser<$ast.moduleItem> = $.alt(PrimitiveTypeDecl, $.alt($Function, $.alt(AsmFunction, $.alt(NativeFunctionDecl, $.alt(Constant, $.alt(StructDecl, $.alt(MessageDecl, $.alt(Contract, Trait))))))));
export const ContractInit: $.Parser<$ast.ContractInit> = $.loc($.field($.pure("ContractInit"), "$", $.right($.str("init"), $.field($.ref(() => parametersFormal), "parameters", $.field($.ref(() => statements), "body", $.eps)))));
export const Receiver: $.Parser<$ast.Receiver> = $.loc($.field($.pure("Receiver"), "$", $.field($.ref(() => receiverType), "type", $.right($.str("("), $.field($.ref(() => receiverParam), "param", $.right($.str(")"), $.field($.ref(() => statements), "body", $.eps)))))));
export const FieldDecl: $.Parser<$ast.FieldDecl> = $.loc($.field($.pure("FieldDecl"), "$", $.field($.ref(() => Id), "name", $.field($.ref(() => ascription), "type", $.field($.opt($.ref(() => asType)), "as", $.field($.opt($.right($.str("="), $.ref(() => expression))), "expression", $.eps))))));
export const semicolon: $.Parser<$ast.semicolon> = $.alt($.str(";"), $.lookPos($.str("}")));
export const storageVar: $.Parser<$ast.storageVar> = $.left(FieldDecl, semicolon);
export const contractItemDecl: $.Parser<$ast.contractItemDecl> = $.alt(ContractInit, $.alt(Receiver, $.alt($Function, $.alt(Constant, storageVar))));
export const traitItemDecl: $.Parser<$ast.traitItemDecl> = $.alt(Receiver, $.alt($Function, $.alt(Constant, storageVar)));
export const FunctionDefinition: $.Parser<$ast.FunctionDefinition> = $.loc($.field($.pure("FunctionDefinition"), "$", $.field($.ref(() => statements), "body", $.eps)));
export const FunctionDeclaration: $.Parser<$ast.FunctionDeclaration> = $.loc($.field($.pure("FunctionDeclaration"), "$", $.right(semicolon, $.eps)));
export const Id: $.Parser<$ast.Id> = $.loc($.field($.pure("Id"), "$", $.field($.lex($.stry($.right($.lookNeg($.ref(() => reservedWord)), $.right($.regex<string | "_">("a-z_", true), $.right($.star($.ref(() => idPart)), $.eps))))), "name", $.eps)));
export const IntegerLiteralDec: $.Parser<$ast.IntegerLiteralDec> = $.loc($.field($.pure("IntegerLiteralDec"), "$", $.field($.lex($.stry($.alt($.right($.regex<string>("1-9", false), $.right($.star($.right($.opt($.str("_")), $.right($.ref(() => digit), $.eps))), $.eps)), $.right($.str("0"), $.right($.star($.ref(() => digit)), $.eps))))), "digits", $.eps)));
export const shuffle: $.Parser<$ast.shuffle> = $.right($.str("("), $.field($.star(Id), "ids", $.field($.opt($.right($.str("->"), $.plus(IntegerLiteralDec))), "to", $.right($.str(")"), $.eps))));
export const ConstantAttribute: $.Parser<$ast.ConstantAttribute> = $.loc($.field($.pure("ConstantAttribute"), "$", $.field($.alt($.ref(() => keyword($.str("virtual"))), $.alt($.ref(() => keyword($.str("override"))), $.ref(() => keyword($.str("abstract"))))), "name", $.eps)));
export const ConstantDefinition: $.Parser<$ast.ConstantDefinition> = $.loc($.field($.pure("ConstantDefinition"), "$", $.right($.str("="), $.field($.ref(() => expression), "expression", $.right(semicolon, $.eps)))));
export const ConstantDeclaration: $.Parser<$ast.ConstantDeclaration> = $.loc($.field($.pure("ConstantDeclaration"), "$", $.right(semicolon, $.eps)));
export const inter = <A, B>(A: $.Parser<A>, B: $.Parser<B>): $.Parser<$ast.inter<A, B>> => $.field($.ref(() => A), "head", $.field($.star($.field($.ref(() => B), "op", $.field($.ref(() => A), "right", $.eps))), "tail", $.eps));
export const structFields: $.Parser<$ast.structFields> = $.left($.opt(inter(FieldDecl, $.str(";"))), $.opt($.str(";")));
export const keyword = <T,>(T: $.Parser<T>): $.Parser<$ast.keyword<T>> => $.lex($.left($.ref(() => T), $.lookNeg($.ref(() => idPart))));
export const inheritedTraits: $.Parser<$ast.inheritedTraits> = $.right(keyword($.str("with")), $.left(inter(Id, $.str(",")), $.opt($.str(","))));
export const ContractAttribute: $.Parser<$ast.ContractAttribute> = $.loc($.field($.pure("ContractAttribute"), "$", $.right($.str("@interface"), $.right($.str("("), $.field($.ref(() => StringLiteral), "name", $.right($.str(")"), $.eps))))));
export const FunctionAttribute: $.Parser<$ast.FunctionAttribute> = $.loc($.field($.pure("FunctionAttribute"), "$", $.field($.alt($.ref(() => GetAttribute), $.alt(keyword($.str("mutates")), $.alt(keyword($.str("extends")), $.alt(keyword($.str("virtual")), $.alt(keyword($.str("override")), $.alt(keyword($.str("inline")), keyword($.str("abstract")))))))), "name", $.eps)));
export const GetAttribute: $.Parser<$ast.GetAttribute> = $.loc($.field($.pure("GetAttribute"), "$", $.right($.str("get"), $.field($.opt($.right($.str("("), $.left($.ref(() => expression), $.str(")")))), "methodId", $.eps))));
export const receiverType: $.Parser<$ast.receiverType> = $.alt($.str("bounced"), $.alt(keyword($.str("receive")), keyword($.str("external"))));
export const Parameter: $.Parser<$ast.Parameter> = $.loc($.field($.pure("Parameter"), "$", $.field(Id, "name", $.field($.ref(() => ascription), "type", $.eps))));
export const StringLiteral: $.Parser<$ast.StringLiteral> = $.loc($.field($.pure("StringLiteral"), "$", $.field($.lex($.right($.str("\""), $.left($.stry($.star($.alt($.regex<"\"" | "\\">("^\"\\\\", false), $.right($.str("\\"), $.ref(() => escapeChar))))), $.str("\"")))), "value", $.eps)));
export const receiverParam: $.Parser<$ast.receiverParam> = $.opt($.alt(Parameter, StringLiteral));
export const multiLineComment: $.Parser<$ast.multiLineComment> = $.right($.str("/*"), $.left($.stry($.star($.right($.lookNeg($.str("*/")), $.right($.any, $.eps)))), $.str("*/")));
export const singleLineComment: $.Parser<$ast.singleLineComment> = $.right($.str("//"), $.stry($.star($.regex<"\r" | "\n">("^\\r\\n", false))));
export const comment: $.Parser<$ast.comment> = $.alt(multiLineComment, singleLineComment);
export const assemblyTerm: $.Parser<$ast.assemblyTerm> = $.alt($.right($.str("{"), $.right($.ref(() => assembly), $.right($.str("}"), $.eps))), $.alt(comment, $.alt($.right($.str("\""), $.right($.star($.regex<"\"">("^\"", false)), $.right($.str("\""), $.eps))), $.plus($.right($.lookNeg($.alt($.regex<"\"" | "{" | "}">("\"{}", false), $.alt($.str("//"), $.str("/*")))), $.right($.any, $.eps))))));
export const assembly: $.Parser<$ast.assembly> = $.star(assemblyTerm);
export const TypeOptional: $.Parser<$ast.TypeOptional> = $.loc($.field($.pure("TypeOptional"), "$", $.field($.ref(() => TypeId), "child", $.right($.str("?"), $.eps))));
export const TypeRegular: $.Parser<$ast.TypeRegular> = $.loc($.field($.pure("TypeRegular"), "$", $.field($.ref(() => TypeId), "child", $.eps)));
export const TypeMap: $.Parser<$ast.TypeMap> = $.loc($.field($.pure("TypeMap"), "$", $.right(keyword($.str("map")), $.right($.str("<"), $.field($.ref(() => TypeId), "key", $.field($.opt($.ref(() => asType)), "keyAs", $.right($.str(","), $.field($.ref(() => TypeId), "value", $.field($.opt($.ref(() => asType)), "valueAs", $.right($.str(">"), $.eps))))))))));
export const TypeBounced: $.Parser<$ast.TypeBounced> = $.loc($.field($.pure("TypeBounced"), "$", $.right($.str("bounced"), $.right($.str("<"), $.field($.ref(() => TypeId), "child", $.right($.str(">"), $.eps))))));
export const $type: $.Parser<$ast.$type> = $.alt(TypeOptional, $.alt(TypeRegular, $.alt(TypeMap, TypeBounced)));
export const ascription: $.Parser<$ast.ascription> = $.right($.str(":"), $type);
export const TypeId: $.Parser<$ast.TypeId> = $.loc($.field($.pure("TypeId"), "$", $.field($.lex($.stry($.right($.regex<string>("A-Z", false), $.right($.star($.regex<string | string | "_">("a-z0-9_", true)), $.eps)))), "name", $.eps)));
export const asType: $.Parser<$ast.asType> = $.right(keyword($.str("as")), Id);
export const StatementLet: $.Parser<$ast.StatementLet> = $.loc($.field($.pure("StatementLet"), "$", $.right(keyword($.str("let")), $.field(Id, "name", $.field($.opt(ascription), "type", $.right($.str("="), $.field($.ref(() => expression), "init", $.right(semicolon, $.eps))))))));
export const StatementBlock: $.Parser<$ast.StatementBlock> = $.loc($.field($.pure("StatementBlock"), "$", $.field($.ref(() => statements), "body", $.eps)));
export const StatementReturn: $.Parser<$ast.StatementReturn> = $.loc($.field($.pure("StatementReturn"), "$", $.right(keyword($.str("return")), $.field($.opt($.ref(() => expression)), "expression", $.right(semicolon, $.eps)))));
export const StatementCondition: $.Parser<$ast.StatementCondition> = $.loc($.field($.pure("StatementCondition"), "$", $.right(keyword($.str("if")), $.field($.ref(() => expression), "condition", $.field($.ref(() => statements), "trueBranch", $.field($.opt($.right(keyword($.str("else")), $.alt($.ref(() => FalseBranch), $.ref(() => StatementCondition)))), "falseBranch", $.eps))))));
export const StatementWhile: $.Parser<$ast.StatementWhile> = $.loc($.field($.pure("StatementWhile"), "$", $.right(keyword($.str("while")), $.field($.ref(() => parens), "condition", $.field($.ref(() => statements), "body", $.eps)))));
export const StatementRepeat: $.Parser<$ast.StatementRepeat> = $.loc($.field($.pure("StatementRepeat"), "$", $.right(keyword($.str("repeat")), $.field($.ref(() => parens), "condition", $.field($.ref(() => statements), "body", $.eps)))));
export const StatementUntil: $.Parser<$ast.StatementUntil> = $.loc($.field($.pure("StatementUntil"), "$", $.right(keyword($.str("do")), $.field($.ref(() => statements), "body", $.right(keyword($.str("until")), $.field($.ref(() => parens), "condition", $.right(semicolon, $.eps)))))));
export const StatementTry: $.Parser<$ast.StatementTry> = $.loc($.field($.pure("StatementTry"), "$", $.right(keyword($.str("try")), $.field($.ref(() => statements), "body", $.field($.opt($.right(keyword($.str("catch")), $.right($.str("("), $.field(Id, "name", $.right($.str(")"), $.field($.ref(() => statements), "body", $.eps)))))), "handler", $.eps)))));
export const StatementForEach: $.Parser<$ast.StatementForEach> = $.loc($.field($.pure("StatementForEach"), "$", $.right(keyword($.str("foreach")), $.right($.str("("), $.field(Id, "key", $.right($.str(","), $.field(Id, "value", $.right($.str("in"), $.field($.ref(() => expression), "expression", $.right($.str(")"), $.field($.ref(() => statements), "body", $.eps)))))))))));
export const StatementExpression: $.Parser<$ast.StatementExpression> = $.loc($.field($.pure("StatementExpression"), "$", $.field($.ref(() => expression), "expression", $.right(semicolon, $.eps))));
export const StatementAssign: $.Parser<$ast.StatementAssign> = $.loc($.field($.pure("StatementAssign"), "$", $.field($.ref(() => expression), "left", $.field($.opt($.ref(() => augmentedOp)), "operator", $.right($.str("="), $.field($.ref(() => expression), "right", $.right(semicolon, $.eps)))))));
export const statement: $.Parser<$ast.statement> = $.alt(StatementLet, $.alt(StatementBlock, $.alt(StatementReturn, $.alt(StatementCondition, $.alt(StatementWhile, $.alt(StatementRepeat, $.alt(StatementUntil, $.alt(StatementTry, $.alt(StatementForEach, $.alt(StatementExpression, StatementAssign))))))))));
export const statements: $.Parser<$ast.statements> = $.right($.str("{"), $.left($.star(statement), $.str("}")));
export const augmentedOp: $.Parser<$ast.augmentedOp> = $.alt($.str("||"), $.alt($.str("&&"), $.alt($.str(">>"), $.alt($.str("<<"), $.regex<"-" | "+" | "*" | "/" | "%" | "|" | "&" | "^">("-+*/%|&^", false)))));
export const FalseBranch: $.Parser<$ast.FalseBranch> = $.loc($.field($.pure("FalseBranch"), "$", $.field(statements, "body", $.eps)));
export const Conditional: $.Parser<$ast.Conditional> = $.loc($.field($.pure("Conditional"), "$", $.field($.ref(() => or), "head", $.field($.opt($.right($.str("?"), $.field($.ref(() => or), "thenBranch", $.right($.str(":"), $.field($.ref(() => Conditional), "elseBranch", $.eps))))), "tail", $.eps))));
export const expression: $.Parser<$ast.expression> = Conditional;
export const Binary = <T, U>(T: $.Parser<T>, U: $.Parser<U>): $.Parser<$ast.Binary<T, U>> => $.loc($.field($.pure("Binary"), "$", $.field(inter($.ref(() => T), $.ref(() => Operator($.ref(() => U)))), "exprs", $.eps)));
export const Unary: $.Parser<$ast.Unary> = $.loc($.field($.pure("Unary"), "$", $.field($.star($.ref(() => Operator($.regex<"-" | "+" | "!" | "~">("-+!~", false)))), "prefixes", $.field($.ref(() => Suffix), "expression", $.eps))));
export const mul: $.Parser<$ast.mul> = Binary(Unary, $.regex<"*" | "/" | "%">("*/%", false));
export const add: $.Parser<$ast.add> = Binary(mul, $.alt($.left($.str("+"), $.lookNeg($.str("+"))), $.left($.str("-"), $.lookNeg($.str("-")))));
export const bitwiseShift: $.Parser<$ast.bitwiseShift> = Binary(add, $.alt($.str("<<"), $.str(">>")));
export const compare: $.Parser<$ast.compare> = Binary(bitwiseShift, $.alt($.str("<="), $.alt($.str("<"), $.alt($.str(">="), $.str(">")))));
export const equality: $.Parser<$ast.equality> = Binary(compare, $.alt($.str("!="), $.str("==")));
export const bitwiseAnd: $.Parser<$ast.bitwiseAnd> = Binary(equality, $.str("&"));
export const bitwiseXor: $.Parser<$ast.bitwiseXor> = Binary(bitwiseAnd, $.str("^"));
export const bitwiseOr: $.Parser<$ast.bitwiseOr> = Binary(bitwiseXor, $.str("|"));
export const and: $.Parser<$ast.and> = Binary(bitwiseOr, $.str("&&"));
export const or: $.Parser<$ast.or> = Binary(and, $.str("||"));
export const Suffix: $.Parser<$ast.Suffix> = $.loc($.field($.pure("Suffix"), "$", $.field($.ref(() => primary), "expression", $.field($.star($.ref(() => suffix)), "suffixes", $.eps))));
export const Operator = <U,>(U: $.Parser<U>): $.Parser<$ast.Operator<U>> => $.loc($.field($.pure("Operator"), "$", $.field($.ref(() => U), "name", $.eps)));
export const SuffixUnboxNotNull: $.Parser<$ast.SuffixUnboxNotNull> = $.loc($.field($.pure("SuffixUnboxNotNull"), "$", $.right($.str("!!"), $.eps)));
export const SuffixCall: $.Parser<$ast.SuffixCall> = $.loc($.field($.pure("SuffixCall"), "$", $.field($.ref(() => parametersPassed), "params", $.eps)));
export const SuffixFieldAccess: $.Parser<$ast.SuffixFieldAccess> = $.loc($.field($.pure("SuffixFieldAccess"), "$", $.right($.str("."), $.field(Id, "name", $.eps))));
export const suffix: $.Parser<$ast.suffix> = $.alt(SuffixUnboxNotNull, $.alt(SuffixCall, SuffixFieldAccess));
export const Parens: $.Parser<$ast.Parens> = $.loc($.field($.pure("Parens"), "$", $.field($.ref(() => parens), "child", $.eps)));
export const StructInstance: $.Parser<$ast.StructInstance> = $.loc($.field($.pure("StructInstance"), "$", $.field(TypeId, "type", $.right($.str("{"), $.field($.opt(inter($.ref(() => StructFieldInitializer), $.str(","))), "fields", $.right($.opt($.str(",")), $.right($.str("}"), $.eps)))))));
export const IntegerLiteral: $.Parser<$ast.IntegerLiteral> = $.loc($.field($.pure("IntegerLiteral"), "$", $.field($.alt($.ref(() => IntegerLiteralHex), $.alt($.ref(() => IntegerLiteralBin), $.alt($.ref(() => IntegerLiteralOct), IntegerLiteralDec))), "value", $.eps)));
export const BoolLiteral: $.Parser<$ast.BoolLiteral> = $.loc($.field($.pure("BoolLiteral"), "$", $.field($.alt($.str("true"), $.str("false")), "value", $.right($.lookNeg($.ref(() => idPart)), $.eps))));
export const InitOf: $.Parser<$ast.InitOf> = $.loc($.field($.pure("InitOf"), "$", $.right(keyword($.str("initOf")), $.field(Id, "name", $.field($.ref(() => parametersPassed), "params", $.eps)))));
export const Null: $.Parser<$ast.Null> = $.loc($.field($.pure("Null"), "$", $.right(keyword($.str("null")), $.eps)));
export const primary: $.Parser<$ast.primary> = $.alt(Parens, $.alt(StructInstance, $.alt(IntegerLiteral, $.alt(BoolLiteral, $.alt(InitOf, $.alt(Null, $.alt(StringLiteral, Id)))))));
export const parens: $.Parser<$ast.parens> = $.right($.str("("), $.left(expression, $.str(")")));
export const StructFieldInitializer: $.Parser<$ast.StructFieldInitializer> = $.loc($.field($.pure("StructFieldInitializer"), "$", $.field(Id, "name", $.field($.opt($.right($.str(":"), expression)), "init", $.eps))));
export const parametersPassed: $.Parser<$ast.parametersPassed> = $.right($.str("("), $.left($.opt($.left(inter(expression, $.str(",")), $.opt($.str(",")))), $.str(")")));
export const parametersFormal: $.Parser<$ast.parametersFormal> = $.right($.str("("), $.left($.opt($.left(inter(Parameter, $.str(",")), $.opt($.str(",")))), $.str(")")));
export const IntegerLiteralHex: $.Parser<$ast.IntegerLiteralHex> = $.loc($.field($.pure("IntegerLiteralHex"), "$", $.field($.lex($.right($.str("0"), $.right($.regex<"x">("x", true), $.stry($.right($.ref(() => hexDigit), $.right($.star($.right($.opt($.str("_")), $.right($.ref(() => hexDigit), $.eps))), $.eps)))))), "digits", $.eps)));
export const IntegerLiteralBin: $.Parser<$ast.IntegerLiteralBin> = $.loc($.field($.pure("IntegerLiteralBin"), "$", $.field($.lex($.right($.str("0"), $.right($.regex<"b">("b", true), $.stry($.right($.regex<"0" | "1">("01", false), $.right($.star($.right($.opt($.str("_")), $.right($.regex<"0" | "1">("01", false), $.eps))), $.eps)))))), "digits", $.eps)));
export const IntegerLiteralOct: $.Parser<$ast.IntegerLiteralOct> = $.loc($.field($.pure("IntegerLiteralOct"), "$", $.field($.lex($.right($.str("0"), $.right($.regex<"o">("o", true), $.stry($.right($.regex<string>("0-7", false), $.right($.star($.right($.opt($.str("_")), $.right($.regex<string>("0-7", false), $.eps))), $.eps)))))), "digits", $.eps)));
export const idPart: $.Parser<$ast.idPart> = $.regex<string | string | "_">("a-z0-9_", true);
export const digit: $.Parser<$ast.digit> = $.regex<string>("0-9", false);
export const hexDigit: $.Parser<$ast.hexDigit> = $.regex<string | string>("0-9a-f", true);
export const whiteSpace: $.Parser<$ast.whiteSpace> = $.regex<" " | "\t" | "\r" | "\n">(" \\t\\r\\n", false);
export const funcPlainId: $.Parser<$ast.funcPlainId> = $.right($.lookNeg($.right($.opt($.str("-")), $.right($.alt($.plus(digit), $.right($.str("0x"), $.right($.plus(hexDigit), $.eps))), $.right($.str(")"), $.eps)))), $.right($.plus($.right($.lookNeg($.alt(whiteSpace, $.regex<"(" | ")" | "[" | string | "," | "." | ";" | "~">("()[\\],.;~", false))), $.right($.any, $.eps))), $.eps));
export const funcQuotedId: $.Parser<$ast.funcQuotedId> = $.right($.str("`"), $.right($.plus($.right($.lookNeg($.regex<"`" | "\n">("`\\n", false)), $.right($.any, $.eps))), $.right($.str("`"), $.eps)));
export const FuncId: $.Parser<$ast.FuncId> = $.loc($.field($.pure("FuncId"), "$", $.right($.lookNeg($.alt($.str("\""), $.str("{-"))), $.field($.opt($.regex<"." | "~">(".~", false)), "accessor", $.field($.lex($.stry($.alt(funcQuotedId, funcPlainId))), "id", $.eps)))));
export const escapeChar: $.Parser<$ast.escapeChar> = $.alt($.regex<"\\" | "\"" | "n" | "r" | "t" | "v" | "b" | "f">("\\\\\"nrtvbf", false), $.alt($.right($.str("u{"), $.left($.stry($.right(hexDigit, $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.eps))))))), $.str("}"))), $.alt($.right($.str("u"), $.stry($.right(hexDigit, $.right(hexDigit, $.right(hexDigit, $.right(hexDigit, $.eps)))))), $.right($.str("x"), $.stry($.right(hexDigit, $.right(hexDigit, $.eps)))))));
export const reservedWord: $.Parser<$ast.reservedWord> = keyword($.alt($.str("extend"), $.alt($.str("public"), $.alt($.str("fun"), $.alt($.str("let"), $.alt($.str("return"), $.alt($.str("receive"), $.alt($.str("native"), $.alt($.str("primitive"), $.alt($.str("null"), $.alt($.str("if"), $.alt($.str("else"), $.alt($.str("while"), $.alt($.str("repeat"), $.alt($.str("do"), $.alt($.str("until"), $.alt($.str("try"), $.alt($.str("catch"), $.alt($.str("foreach"), $.alt($.str("as"), $.alt($.str("map"), $.alt($.str("mutates"), $.alt($.str("extends"), $.alt($.str("external"), $.alt($.str("import"), $.alt($.str("with"), $.alt($.str("trait"), $.alt($.str("initOf"), $.alt($.str("override"), $.alt($.str("abstract"), $.alt($.str("virtual"), $.alt($.str("inline"), $.str("const")))))))))))))))))))))))))))))))));
export const space: $.Parser<$ast.space> = $.alt($.regex<" " | "\t" | "\r" | "\n">(" \\t\\r\\n", false), comment);
export const JustImports: $.Parser<$ast.JustImports> = $.loc($.field($.pure("JustImports"), "$", $.field($.star(Import), "imports", $.right($.star($.any), $.eps))));