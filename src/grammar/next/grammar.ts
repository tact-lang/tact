/* Generated. Do not edit. */
/* eslint-disable @typescript-eslint/no-namespace */
/* eslint-disable @typescript-eslint/ban-types */
/* eslint-disable @typescript-eslint/no-redundant-type-constituents */
/* eslint-disable @typescript-eslint/no-duplicate-type-constituents */
/* eslint-disable @typescript-eslint/no-unused-vars */
import * as $ from "@tonstudio/parser-runtime";
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
    readonly parameters: parameterList<Parameter>;
    readonly returnType: ascription | undefined;
    readonly body: FunctionDefinition | FunctionDeclaration;
  }>;
  export type AsmFunction = $.Located<{
    readonly $: "AsmFunction";
    readonly shuffle: shuffle | undefined;
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly parameters: parameterList<Parameter>;
    readonly returnType: ascription | undefined;
    readonly instructions: assembly;
  }>;
  export type NativeFunctionDecl = $.Located<{
    readonly $: "NativeFunctionDecl";
    readonly nativeName: FuncId;
    readonly attributes: readonly FunctionAttribute[];
    readonly name: Id;
    readonly parameters: parameterList<Parameter>;
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
    readonly opcode: expression | undefined;
    readonly name: TypeId;
    readonly fields: structFields;
  }>;
  export type Contract = $.Located<{
    readonly $: "Contract";
    readonly attributes: readonly ContractAttribute[];
    readonly name: Id;
    readonly parameters: parameterList<Parameter> | undefined;
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
    readonly parameters: parameterList<Parameter>;
    readonly body: statements;
  }>;
  export type Receiver = $.Located<{
    readonly $: "Receiver";
    readonly type: ReceiverType;
    readonly param: receiverParam;
    readonly body: statements;
  }>;
  export type FieldDecl = $.Located<{
    readonly $: "FieldDecl";
    readonly name: Id;
    readonly type: ascription;
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
    readonly digits: underscored<digit>;
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
  export type commaList<T> = inter<T, ",">;
  export type inheritedTraits = commaList<Id>;
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
  export type ReceiverType = $.Located<{
    readonly $: "ReceiverType";
    readonly name: "bounced" | keyword<"receive"> | keyword<"external">;
  }>;
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
  export type assembly = string;
  export type multiLineComment = string;
  export type singleLineComment = string;
  export type comment = multiLineComment | singleLineComment;
  export type assemblyItem = {} | comment | {} | readonly {}[];
  export type assemblySequence = readonly assemblyItem[];
  export type TypeAs = $.Located<{
    readonly $: "TypeAs";
    readonly type: TypeOptional;
    readonly as: readonly Id[];
  }>;
  export type $type = TypeAs;
  export type ascription = $type;
  export type TypeOptional = $.Located<{
    readonly $: "TypeOptional";
    readonly type: typePrimary;
    readonly optionals: readonly "?"[];
  }>;
  export type TypeGeneric = $.Located<{
    readonly $: "TypeGeneric";
    readonly name: MapKeyword | Bounced | TypeId;
    readonly args: commaList<$type>;
  }>;
  export type TypeRegular = $.Located<{
    readonly $: "TypeRegular";
    readonly child: TypeId;
  }>;
  export type typePrimary = TypeGeneric | TypeRegular;
  export type MapKeyword = $.Located<{
    readonly $: "MapKeyword";
  }>;
  export type Bounced = $.Located<{
    readonly $: "Bounced";
  }>;
  export type TypeId = $.Located<{
    readonly $: "TypeId";
    readonly name: string;
  }>;
  export type StatementLet = $.Located<{
    readonly $: "StatementLet";
    readonly name: Id;
    readonly type: ascription | undefined;
    readonly init: expression;
  }>;
  export type StatementDestruct = $.Located<{
    readonly $: "StatementDestruct";
    readonly type: TypeId;
    readonly fields: inter<destructItem, ",">;
    readonly rest: optionalRest;
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
  export type statement = StatementLet | StatementDestruct | StatementBlock | StatementReturn | StatementCondition | StatementWhile | StatementRepeat | StatementUntil | StatementTry | StatementForEach | StatementExpression | StatementAssign;
  export type statements = readonly statement[];
  export type augmentedOp = "||" | "&&" | ">>" | "<<" | "-" | "+" | "*" | "/" | "%" | "|" | "&" | "^";
  export type FalseBranch = $.Located<{
    readonly $: "FalseBranch";
    readonly body: statements;
  }>;
  export type RegularField = $.Located<{
    readonly $: "RegularField";
    readonly fieldName: Id;
    readonly varName: Id;
  }>;
  export type PunnedField = $.Located<{
    readonly $: "PunnedField";
    readonly name: Id;
  }>;
  export type destructItem = RegularField | PunnedField;
  export type RestArgument = $.Located<{
    readonly $: "RestArgument";
  }>;
  export type NoRestArgument = $.Located<{
    readonly $: "NoRestArgument";
  }>;
  export type optionalRest = RestArgument | NoRestArgument;
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
    readonly params: parameterList<expression>;
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
    readonly fields: commaList<StructFieldInitializer> | undefined;
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
    readonly params: parameterList<expression>;
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
  export type parameterList<T> = commaList<T> | undefined;
  export type IntegerLiteralHex = $.Located<{
    readonly $: "IntegerLiteralHex";
    readonly digits: underscored<hexDigit>;
  }>;
  export type IntegerLiteralBin = $.Located<{
    readonly $: "IntegerLiteralBin";
    readonly digits: underscored<"0" | "1">;
  }>;
  export type IntegerLiteralOct = $.Located<{
    readonly $: "IntegerLiteralOct";
    readonly digits: underscored<string>;
  }>;
  export type underscored<T> = string;
  export type digit = string;
  export type idPart = string | string | string | "_";
  export type FuncId = $.Located<{
    readonly $: "FuncId";
    readonly accessor: "." | "~" | undefined;
    readonly id: string;
  }>;
  export type hexDigit = string | string | string;
  export type escapeChar = "\\" | "\"" | "n" | "r" | "t" | "v" | "b" | "f" | string | string | string;
  export type reservedWord = keyword<"extend" | "public" | "fun" | "let" | "return" | "receive" | "native" | "primitive" | "null" | "if" | "else" | "while" | "repeat" | "do" | "until" | "try" | "catch" | "foreach" | "as" | "map" | "mutates" | "extends" | "external" | "import" | "with" | "trait" | "initOf" | "override" | "abstract" | "virtual" | "inline" | "const">;
  export type space = " " | "\t" | "\r" | "\n" | comment;
  export type JustImports = $.Located<{
    readonly $: "JustImports";
    readonly imports: readonly Import[];
  }>;
}
export const Module: $.Parser<$ast.Module> = $.loc($.field($.pure("Module"), "$", $.field($.star($.lazy(() => Import)), "imports", $.field($.star($.lazy(() => moduleItem)), "items", $.eps))));
export const Import: $.Parser<$ast.Import> = $.loc($.field($.pure("Import"), "$", $.right($.lazy(() => keyword($.str("import"))), $.field($.lazy(() => StringLiteral), "path", $.right($.str(";"), $.eps)))));
export const PrimitiveTypeDecl: $.Parser<$ast.PrimitiveTypeDecl> = $.loc($.field($.pure("PrimitiveTypeDecl"), "$", $.right($.lazy(() => keyword($.str("primitive"))), $.field($.lazy(() => TypeId), "name", $.right($.str(";"), $.eps)))));
export const $Function: $.Parser<$ast.$Function> = $.loc($.field($.pure("Function"), "$", $.field($.star($.lazy(() => FunctionAttribute)), "attributes", $.right($.lazy(() => keyword($.str("fun"))), $.field($.lazy(() => Id), "name", $.field($.lazy(() => parameterList($.lazy(() => Parameter))), "parameters", $.field($.opt($.lazy(() => ascription)), "returnType", $.field($.alt($.lazy(() => FunctionDefinition), $.lazy(() => FunctionDeclaration)), "body", $.eps))))))));
export const AsmFunction: $.Parser<$ast.AsmFunction> = $.loc($.field($.pure("AsmFunction"), "$", $.right($.str("asm"), $.field($.opt($.lazy(() => shuffle)), "shuffle", $.field($.star($.lazy(() => FunctionAttribute)), "attributes", $.right($.lazy(() => keyword($.str("fun"))), $.field($.lazy(() => Id), "name", $.field($.lazy(() => parameterList($.lazy(() => Parameter))), "parameters", $.field($.opt($.lazy(() => ascription)), "returnType", $.right($.str("{"), $.field($.lazy(() => assembly), "instructions", $.right($.str("}"), $.eps))))))))))));
export const NativeFunctionDecl: $.Parser<$ast.NativeFunctionDecl> = $.loc($.field($.pure("NativeFunctionDecl"), "$", $.right($.str("@name"), $.right($.str("("), $.field($.lex($.lazy(() => FuncId)), "nativeName", $.right($.str(")"), $.field($.star($.lazy(() => FunctionAttribute)), "attributes", $.right($.lazy(() => keyword($.str("native"))), $.field($.lazy(() => Id), "name", $.field($.lazy(() => parameterList($.lazy(() => Parameter))), "parameters", $.field($.opt($.lazy(() => ascription)), "returnType", $.right($.str(";"), $.eps))))))))))));
export const Constant: $.Parser<$ast.Constant> = $.loc($.field($.pure("Constant"), "$", $.field($.star($.lazy(() => ConstantAttribute)), "attributes", $.right($.lazy(() => keyword($.str("const"))), $.field($.lazy(() => Id), "name", $.field($.lazy(() => ascription), "type", $.field($.alt($.lazy(() => ConstantDefinition), $.lazy(() => ConstantDeclaration)), "body", $.eps)))))));
export const StructDecl: $.Parser<$ast.StructDecl> = $.loc($.field($.pure("StructDecl"), "$", $.right($.str("struct"), $.field($.lazy(() => TypeId), "name", $.right($.str("{"), $.field($.lazy(() => structFields), "fields", $.right($.str("}"), $.eps)))))));
export const MessageDecl: $.Parser<$ast.MessageDecl> = $.loc($.field($.pure("MessageDecl"), "$", $.right($.str("message"), $.field($.opt($.right($.str("("), $.left($.lazy(() => expression), $.str(")")))), "opcode", $.field($.lazy(() => TypeId), "name", $.right($.str("{"), $.field($.lazy(() => structFields), "fields", $.right($.str("}"), $.eps))))))));
export const Contract: $.Parser<$ast.Contract> = $.loc($.field($.pure("Contract"), "$", $.field($.star($.lazy(() => ContractAttribute)), "attributes", $.right($.lazy(() => keyword($.str("contract"))), $.field($.lazy(() => Id), "name", $.field($.opt($.lazy(() => parameterList($.lazy(() => Parameter)))), "parameters", $.field($.opt($.lazy(() => inheritedTraits)), "traits", $.right($.str("{"), $.field($.star($.lazy(() => contractItemDecl)), "declarations", $.right($.str("}"), $.eps))))))))));
export const Trait: $.Parser<$ast.Trait> = $.loc($.field($.pure("Trait"), "$", $.field($.star($.lazy(() => ContractAttribute)), "attributes", $.right($.lazy(() => keyword($.str("trait"))), $.field($.lazy(() => Id), "name", $.field($.opt($.lazy(() => inheritedTraits)), "traits", $.right($.str("{"), $.field($.star($.lazy(() => traitItemDecl)), "declarations", $.right($.str("}"), $.eps)))))))));
export const moduleItem: $.Parser<$ast.moduleItem> = $.alt(PrimitiveTypeDecl, $.alt($Function, $.alt(AsmFunction, $.alt(NativeFunctionDecl, $.alt(Constant, $.alt(StructDecl, $.alt(MessageDecl, $.alt(Contract, Trait))))))));
export const ContractInit: $.Parser<$ast.ContractInit> = $.loc($.field($.pure("ContractInit"), "$", $.right($.str("init"), $.field($.lazy(() => parameterList($.lazy(() => Parameter))), "parameters", $.field($.lazy(() => statements), "body", $.eps)))));
export const Receiver: $.Parser<$ast.Receiver> = $.loc($.field($.pure("Receiver"), "$", $.field($.lazy(() => ReceiverType), "type", $.right($.str("("), $.field($.lazy(() => receiverParam), "param", $.right($.str(")"), $.field($.lazy(() => statements), "body", $.eps)))))));
export const FieldDecl: $.Parser<$ast.FieldDecl> = $.loc($.field($.pure("FieldDecl"), "$", $.field($.lazy(() => Id), "name", $.field($.lazy(() => ascription), "type", $.field($.opt($.right($.str("="), $.lazy(() => expression))), "expression", $.eps)))));
export const semicolon: $.Parser<$ast.semicolon> = $.alt($.str(";"), $.lookPos($.str("}")));
export const storageVar: $.Parser<$ast.storageVar> = $.left(FieldDecl, semicolon);
export const contractItemDecl: $.Parser<$ast.contractItemDecl> = $.alt(ContractInit, $.alt(Receiver, $.alt($Function, $.alt(Constant, storageVar))));
export const traitItemDecl: $.Parser<$ast.traitItemDecl> = $.alt(Receiver, $.alt($Function, $.alt(Constant, storageVar)));
export const FunctionDefinition: $.Parser<$ast.FunctionDefinition> = $.loc($.field($.pure("FunctionDefinition"), "$", $.field($.lazy(() => statements), "body", $.eps)));
export const FunctionDeclaration: $.Parser<$ast.FunctionDeclaration> = $.loc($.field($.pure("FunctionDeclaration"), "$", $.right(semicolon, $.eps)));
export const Id: $.Parser<$ast.Id> = $.named("identifier", $.loc($.field($.pure("Id"), "$", $.field($.lex($.stry($.right($.lookNeg($.lazy(() => reservedWord)), $.right($.regex<string | string | "_">("a-zA-Z_", [$.ExpRange("a", "z"), $.ExpRange("A", "Z"), $.ExpString("_")]), $.right($.star($.lazy(() => idPart)), $.eps))))), "name", $.eps))));
export const IntegerLiteralDec: $.Parser<$ast.IntegerLiteralDec> = $.loc($.field($.pure("IntegerLiteralDec"), "$", $.field($.lex($.lazy(() => underscored($.lazy(() => digit)))), "digits", $.eps)));
export const shuffle: $.Parser<$ast.shuffle> = $.right($.str("("), $.field($.star(Id), "ids", $.field($.opt($.right($.str("->"), $.plus(IntegerLiteralDec))), "to", $.right($.str(")"), $.eps))));
export const ConstantAttribute: $.Parser<$ast.ConstantAttribute> = $.loc($.field($.pure("ConstantAttribute"), "$", $.field($.alt($.lazy(() => keyword($.str("virtual"))), $.alt($.lazy(() => keyword($.str("override"))), $.lazy(() => keyword($.str("abstract"))))), "name", $.eps)));
export const ConstantDefinition: $.Parser<$ast.ConstantDefinition> = $.loc($.field($.pure("ConstantDefinition"), "$", $.right($.str("="), $.field($.lazy(() => expression), "expression", $.right(semicolon, $.eps)))));
export const ConstantDeclaration: $.Parser<$ast.ConstantDeclaration> = $.loc($.field($.pure("ConstantDeclaration"), "$", $.right(semicolon, $.eps)));
export const inter = <A, B>(A: $.Parser<A>, B: $.Parser<B>): $.Parser<$ast.inter<A, B>> => $.field($.lazy(() => A), "head", $.field($.star($.field($.lazy(() => B), "op", $.field($.lazy(() => A), "right", $.eps))), "tail", $.eps));
export const structFields: $.Parser<$ast.structFields> = $.left($.opt(inter(FieldDecl, $.str(";"))), $.opt($.str(";")));
export const keyword = <T,>(T: $.Parser<T>): $.Parser<$ast.keyword<T>> => $.lex($.left($.lazy(() => T), $.lookNeg($.lazy(() => idPart))));
export const commaList = <T,>(T: $.Parser<T>): $.Parser<$ast.commaList<T>> => $.left(inter($.lazy(() => T), $.str(",")), $.opt($.str(",")));
export const inheritedTraits: $.Parser<$ast.inheritedTraits> = $.right(keyword($.str("with")), commaList(Id));
export const ContractAttribute: $.Parser<$ast.ContractAttribute> = $.loc($.field($.pure("ContractAttribute"), "$", $.right($.str("@interface"), $.right($.str("("), $.field($.lazy(() => StringLiteral), "name", $.right($.str(")"), $.eps))))));
export const FunctionAttribute: $.Parser<$ast.FunctionAttribute> = $.loc($.field($.pure("FunctionAttribute"), "$", $.field($.alt($.lazy(() => GetAttribute), $.alt(keyword($.str("mutates")), $.alt(keyword($.str("extends")), $.alt(keyword($.str("virtual")), $.alt(keyword($.str("override")), $.alt(keyword($.str("inline")), keyword($.str("abstract")))))))), "name", $.eps)));
export const GetAttribute: $.Parser<$ast.GetAttribute> = $.loc($.field($.pure("GetAttribute"), "$", $.right($.str("get"), $.field($.opt($.right($.str("("), $.left($.lazy(() => expression), $.str(")")))), "methodId", $.eps))));
export const ReceiverType: $.Parser<$ast.ReceiverType> = $.loc($.field($.pure("ReceiverType"), "$", $.field($.alt($.str("bounced"), $.alt(keyword($.str("receive")), keyword($.str("external")))), "name", $.eps)));
export const Parameter: $.Parser<$ast.Parameter> = $.loc($.field($.pure("Parameter"), "$", $.field(Id, "name", $.field($.lazy(() => ascription), "type", $.eps))));
export const StringLiteral: $.Parser<$ast.StringLiteral> = $.loc($.field($.pure("StringLiteral"), "$", $.field($.lex($.right($.str("\""), $.left($.stry($.star($.alt($.regex<"\"" | "\\">("^\"\\\\", $.negateExps([$.ExpString("\""), $.ExpString("\\")])), $.right($.str("\\"), $.lazy(() => escapeChar))))), $.str("\"")))), "value", $.eps)));
export const receiverParam: $.Parser<$ast.receiverParam> = $.opt($.alt(Parameter, StringLiteral));
export const assembly: $.Parser<$ast.assembly> = $.lex($.stry($.lazy(() => assemblySequence)));
export const multiLineComment: $.Parser<$ast.multiLineComment> = $.right($.str("/*"), $.left($.stry($.star($.right($.lookNeg($.str("*/")), $.right($.any, $.eps)))), $.str("*/")));
export const singleLineComment: $.Parser<$ast.singleLineComment> = $.right($.str("//"), $.stry($.star($.regex<"\r" | "\n">("^\\r\\n", $.negateExps([$.ExpString("\r"), $.ExpString("\n")])))));
export const comment: $.Parser<$ast.comment> = $.alt(multiLineComment, singleLineComment);
export const assemblyItem: $.Parser<$ast.assemblyItem> = $.alt($.right($.str("{"), $.right($.lazy(() => assemblySequence), $.right($.str("}"), $.eps))), $.alt(comment, $.alt($.right($.str("\""), $.right($.star($.regex<"\"">("^\"", $.negateExps([$.ExpString("\"")]))), $.right($.str("\""), $.eps))), $.plus($.right($.lookNeg($.alt($.regex<"\"" | "{" | "}">("\"{}", [$.ExpString("\""), $.ExpString("{"), $.ExpString("}")]), $.alt($.str("//"), $.str("/*")))), $.right($.any, $.eps))))));
export const assemblySequence: $.Parser<$ast.assemblySequence> = $.star(assemblyItem);
export const TypeAs: $.Parser<$ast.TypeAs> = $.loc($.field($.pure("TypeAs"), "$", $.field($.lazy(() => TypeOptional), "type", $.field($.star($.right(keyword($.str("as")), Id)), "as", $.eps))));
export const $type: $.Parser<$ast.$type> = TypeAs;
export const ascription: $.Parser<$ast.ascription> = $.right($.str(":"), $type);
export const TypeOptional: $.Parser<$ast.TypeOptional> = $.loc($.field($.pure("TypeOptional"), "$", $.field($.lazy(() => typePrimary), "type", $.field($.star($.str("?")), "optionals", $.eps))));
export const TypeGeneric: $.Parser<$ast.TypeGeneric> = $.loc($.field($.pure("TypeGeneric"), "$", $.field($.alt($.lazy(() => MapKeyword), $.alt($.lazy(() => Bounced), $.lazy(() => TypeId))), "name", $.right($.str("<"), $.field(commaList($type), "args", $.right($.str(">"), $.eps))))));
export const TypeRegular: $.Parser<$ast.TypeRegular> = $.loc($.field($.pure("TypeRegular"), "$", $.field($.lazy(() => TypeId), "child", $.eps)));
export const typePrimary: $.Parser<$ast.typePrimary> = $.alt(TypeGeneric, TypeRegular);
export const MapKeyword: $.Parser<$ast.MapKeyword> = $.loc($.field($.pure("MapKeyword"), "$", $.right(keyword($.str("map")), $.eps)));
export const Bounced: $.Parser<$ast.Bounced> = $.loc($.field($.pure("Bounced"), "$", $.right($.str("bounced"), $.eps)));
export const TypeId: $.Parser<$ast.TypeId> = $.named("capitalized identifier", $.loc($.field($.pure("TypeId"), "$", $.field($.lex($.stry($.right($.regex<string>("A-Z", [$.ExpRange("A", "Z")]), $.right($.star($.regex<string | string | string | "_">("a-zA-Z0-9_", [$.ExpRange("a", "z"), $.ExpRange("A", "Z"), $.ExpRange("0", "9"), $.ExpString("_")])), $.eps)))), "name", $.eps))));
export const StatementLet: $.Parser<$ast.StatementLet> = $.loc($.field($.pure("StatementLet"), "$", $.right(keyword($.str("let")), $.field(Id, "name", $.field($.opt(ascription), "type", $.right($.str("="), $.field($.lazy(() => expression), "init", $.right(semicolon, $.eps))))))));
export const StatementDestruct: $.Parser<$ast.StatementDestruct> = $.loc($.field($.pure("StatementDestruct"), "$", $.right(keyword($.str("let")), $.field(TypeId, "type", $.right($.str("{"), $.field(inter($.lazy(() => destructItem), $.str(",")), "fields", $.field($.lazy(() => optionalRest), "rest", $.right($.str("}"), $.right($.str("="), $.field($.lazy(() => expression), "init", $.right(semicolon, $.eps)))))))))));
export const StatementBlock: $.Parser<$ast.StatementBlock> = $.loc($.field($.pure("StatementBlock"), "$", $.field($.lazy(() => statements), "body", $.eps)));
export const StatementReturn: $.Parser<$ast.StatementReturn> = $.loc($.field($.pure("StatementReturn"), "$", $.right(keyword($.str("return")), $.field($.opt($.lazy(() => expression)), "expression", $.right(semicolon, $.eps)))));
export const StatementCondition: $.Parser<$ast.StatementCondition> = $.loc($.field($.pure("StatementCondition"), "$", $.right(keyword($.str("if")), $.field($.lazy(() => expression), "condition", $.field($.lazy(() => statements), "trueBranch", $.field($.opt($.right(keyword($.str("else")), $.alt($.lazy(() => FalseBranch), $.lazy(() => StatementCondition)))), "falseBranch", $.eps))))));
export const StatementWhile: $.Parser<$ast.StatementWhile> = $.loc($.field($.pure("StatementWhile"), "$", $.right(keyword($.str("while")), $.field($.lazy(() => parens), "condition", $.field($.lazy(() => statements), "body", $.eps)))));
export const StatementRepeat: $.Parser<$ast.StatementRepeat> = $.loc($.field($.pure("StatementRepeat"), "$", $.right(keyword($.str("repeat")), $.field($.lazy(() => parens), "condition", $.field($.lazy(() => statements), "body", $.eps)))));
export const StatementUntil: $.Parser<$ast.StatementUntil> = $.loc($.field($.pure("StatementUntil"), "$", $.right(keyword($.str("do")), $.field($.lazy(() => statements), "body", $.right(keyword($.str("until")), $.field($.lazy(() => parens), "condition", $.right(semicolon, $.eps)))))));
export const StatementTry: $.Parser<$ast.StatementTry> = $.loc($.field($.pure("StatementTry"), "$", $.right(keyword($.str("try")), $.field($.lazy(() => statements), "body", $.field($.opt($.right(keyword($.str("catch")), $.right($.str("("), $.field(Id, "name", $.right($.str(")"), $.field($.lazy(() => statements), "body", $.eps)))))), "handler", $.eps)))));
export const StatementForEach: $.Parser<$ast.StatementForEach> = $.loc($.field($.pure("StatementForEach"), "$", $.right(keyword($.str("foreach")), $.right($.str("("), $.field(Id, "key", $.right($.str(","), $.field(Id, "value", $.right($.str("in"), $.field($.lazy(() => expression), "expression", $.right($.str(")"), $.field($.lazy(() => statements), "body", $.eps)))))))))));
export const StatementExpression: $.Parser<$ast.StatementExpression> = $.loc($.field($.pure("StatementExpression"), "$", $.field($.lazy(() => expression), "expression", $.right(semicolon, $.eps))));
export const StatementAssign: $.Parser<$ast.StatementAssign> = $.loc($.field($.pure("StatementAssign"), "$", $.field($.lazy(() => expression), "left", $.field($.opt($.lazy(() => augmentedOp)), "operator", $.right($.str("="), $.field($.lazy(() => expression), "right", $.right(semicolon, $.eps)))))));
export const statement: $.Parser<$ast.statement> = $.alt(StatementLet, $.alt(StatementDestruct, $.alt(StatementBlock, $.alt(StatementReturn, $.alt(StatementCondition, $.alt(StatementWhile, $.alt(StatementRepeat, $.alt(StatementUntil, $.alt(StatementTry, $.alt(StatementForEach, $.alt(StatementExpression, StatementAssign)))))))))));
export const statements: $.Parser<$ast.statements> = $.right($.str("{"), $.left($.star(statement), $.str("}")));
export const augmentedOp: $.Parser<$ast.augmentedOp> = $.alt($.str("||"), $.alt($.str("&&"), $.alt($.str(">>"), $.alt($.str("<<"), $.regex<"-" | "+" | "*" | "/" | "%" | "|" | "&" | "^">("-+*/%|&^", [$.ExpString("-"), $.ExpString("+"), $.ExpString("*"), $.ExpString("/"), $.ExpString("%"), $.ExpString("|"), $.ExpString("&"), $.ExpString("^")])))));
export const FalseBranch: $.Parser<$ast.FalseBranch> = $.loc($.field($.pure("FalseBranch"), "$", $.field(statements, "body", $.eps)));
export const RegularField: $.Parser<$ast.RegularField> = $.loc($.field($.pure("RegularField"), "$", $.field(Id, "fieldName", $.right($.str(":"), $.field(Id, "varName", $.eps)))));
export const PunnedField: $.Parser<$ast.PunnedField> = $.loc($.field($.pure("PunnedField"), "$", $.field(Id, "name", $.eps)));
export const destructItem: $.Parser<$ast.destructItem> = $.alt(RegularField, PunnedField);
export const RestArgument: $.Parser<$ast.RestArgument> = $.loc($.field($.pure("RestArgument"), "$", $.right($.str(".."), $.eps)));
export const NoRestArgument: $.Parser<$ast.NoRestArgument> = $.loc($.field($.pure("NoRestArgument"), "$", $.right($.opt($.str(",")), $.eps)));
export const optionalRest: $.Parser<$ast.optionalRest> = $.alt($.right($.str(","), RestArgument), NoRestArgument);
export const Conditional: $.Parser<$ast.Conditional> = $.loc($.field($.pure("Conditional"), "$", $.field($.lazy(() => or), "head", $.field($.opt($.right($.str("?"), $.field($.lazy(() => or), "thenBranch", $.right($.str(":"), $.field($.lazy(() => Conditional), "elseBranch", $.eps))))), "tail", $.eps))));
export const expression: $.Parser<$ast.expression> = Conditional;
export const Binary = <T, U>(T: $.Parser<T>, U: $.Parser<U>): $.Parser<$ast.Binary<T, U>> => $.loc($.field($.pure("Binary"), "$", $.field(inter($.lazy(() => T), $.lazy(() => Operator($.lazy(() => U)))), "exprs", $.eps)));
export const Unary: $.Parser<$ast.Unary> = $.loc($.field($.pure("Unary"), "$", $.field($.star($.lazy(() => Operator($.regex<"-" | "+" | "!" | "~">("-+!~", [$.ExpString("-"), $.ExpString("+"), $.ExpString("!"), $.ExpString("~")])))), "prefixes", $.field($.lazy(() => Suffix), "expression", $.eps))));
export const mul: $.Parser<$ast.mul> = Binary(Unary, $.regex<"*" | "/" | "%">("*/%", [$.ExpString("*"), $.ExpString("/"), $.ExpString("%")]));
export const add: $.Parser<$ast.add> = Binary(mul, $.alt($.str("+"), $.str("-")));
export const bitwiseShift: $.Parser<$ast.bitwiseShift> = Binary(add, $.alt($.str("<<"), $.str(">>")));
export const compare: $.Parser<$ast.compare> = Binary(bitwiseShift, $.alt($.str("<="), $.alt($.str("<"), $.alt($.str(">="), $.str(">")))));
export const equality: $.Parser<$ast.equality> = Binary(compare, $.alt($.str("!="), $.str("==")));
export const bitwiseAnd: $.Parser<$ast.bitwiseAnd> = Binary(equality, $.str("&"));
export const bitwiseXor: $.Parser<$ast.bitwiseXor> = Binary(bitwiseAnd, $.str("^"));
export const bitwiseOr: $.Parser<$ast.bitwiseOr> = Binary(bitwiseXor, $.str("|"));
export const and: $.Parser<$ast.and> = Binary(bitwiseOr, $.str("&&"));
export const or: $.Parser<$ast.or> = Binary(and, $.str("||"));
export const Suffix: $.Parser<$ast.Suffix> = $.loc($.field($.pure("Suffix"), "$", $.field($.lazy(() => primary), "expression", $.field($.star($.lazy(() => suffix)), "suffixes", $.eps))));
export const Operator = <U,>(U: $.Parser<U>): $.Parser<$ast.Operator<U>> => $.loc($.field($.pure("Operator"), "$", $.field($.lazy(() => U), "name", $.eps)));
export const SuffixUnboxNotNull: $.Parser<$ast.SuffixUnboxNotNull> = $.loc($.field($.pure("SuffixUnboxNotNull"), "$", $.right($.str("!!"), $.eps)));
export const SuffixCall: $.Parser<$ast.SuffixCall> = $.loc($.field($.pure("SuffixCall"), "$", $.field($.lazy(() => parameterList(expression)), "params", $.eps)));
export const SuffixFieldAccess: $.Parser<$ast.SuffixFieldAccess> = $.loc($.field($.pure("SuffixFieldAccess"), "$", $.right($.str("."), $.field(Id, "name", $.eps))));
export const suffix: $.Parser<$ast.suffix> = $.alt(SuffixUnboxNotNull, $.alt(SuffixCall, SuffixFieldAccess));
export const Parens: $.Parser<$ast.Parens> = $.loc($.field($.pure("Parens"), "$", $.field($.lazy(() => parens), "child", $.eps)));
export const StructInstance: $.Parser<$ast.StructInstance> = $.loc($.field($.pure("StructInstance"), "$", $.field(TypeId, "type", $.right($.str("{"), $.field($.opt(commaList($.lazy(() => StructFieldInitializer))), "fields", $.right($.str("}"), $.eps))))));
export const IntegerLiteral: $.Parser<$ast.IntegerLiteral> = $.loc($.field($.pure("IntegerLiteral"), "$", $.field($.alt($.lazy(() => IntegerLiteralHex), $.alt($.lazy(() => IntegerLiteralBin), $.alt($.lazy(() => IntegerLiteralOct), IntegerLiteralDec))), "value", $.eps)));
export const BoolLiteral: $.Parser<$ast.BoolLiteral> = $.loc($.field($.pure("BoolLiteral"), "$", $.field($.alt($.str("true"), $.str("false")), "value", $.right($.lookNeg($.lazy(() => idPart)), $.eps))));
export const InitOf: $.Parser<$ast.InitOf> = $.loc($.field($.pure("InitOf"), "$", $.right(keyword($.str("initOf")), $.field(Id, "name", $.field($.lazy(() => parameterList(expression)), "params", $.eps)))));
export const Null: $.Parser<$ast.Null> = $.loc($.field($.pure("Null"), "$", $.right(keyword($.str("null")), $.eps)));
export const primary: $.Parser<$ast.primary> = $.alt(Parens, $.alt(StructInstance, $.alt(IntegerLiteral, $.alt(BoolLiteral, $.alt(InitOf, $.alt(Null, $.alt(StringLiteral, Id)))))));
export const parens: $.Parser<$ast.parens> = $.right($.str("("), $.left(expression, $.str(")")));
export const StructFieldInitializer: $.Parser<$ast.StructFieldInitializer> = $.loc($.field($.pure("StructFieldInitializer"), "$", $.field(Id, "name", $.field($.opt($.right($.str(":"), expression)), "init", $.eps))));
export const parameterList = <T,>(T: $.Parser<T>): $.Parser<$ast.parameterList<T>> => $.right($.str("("), $.left($.opt(commaList($.lazy(() => T))), $.str(")")));
export const IntegerLiteralHex: $.Parser<$ast.IntegerLiteralHex> = $.loc($.field($.pure("IntegerLiteralHex"), "$", $.field($.lex($.right($.str("0"), $.right($.regex<"x" | "X">("xX", [$.ExpString("x"), $.ExpString("X")]), $.lazy(() => underscored($.lazy(() => hexDigit)))))), "digits", $.eps)));
export const IntegerLiteralBin: $.Parser<$ast.IntegerLiteralBin> = $.loc($.field($.pure("IntegerLiteralBin"), "$", $.field($.lex($.right($.str("0"), $.right($.regex<"b" | "B">("bB", [$.ExpString("b"), $.ExpString("B")]), $.lazy(() => underscored($.regex<"0" | "1">("01", [$.ExpString("0"), $.ExpString("1")])))))), "digits", $.eps)));
export const IntegerLiteralOct: $.Parser<$ast.IntegerLiteralOct> = $.loc($.field($.pure("IntegerLiteralOct"), "$", $.field($.lex($.right($.str("0"), $.right($.regex<"o" | "O">("oO", [$.ExpString("o"), $.ExpString("O")]), $.lazy(() => underscored($.regex<string>("0-7", [$.ExpRange("0", "7")])))))), "digits", $.eps)));
export const underscored = <T,>(T: $.Parser<T>): $.Parser<$ast.underscored<T>> => $.stry($.right($.lazy(() => T), $.right($.star($.right($.opt($.str("_")), $.right($.lazy(() => T), $.eps))), $.eps)));
export const digit: $.Parser<$ast.digit> = $.named("digit", $.regex<string>("0-9", [$.ExpRange("0", "9")]));
export const idPart: $.Parser<$ast.idPart> = $.named("identifier character", $.regex<string | string | string | "_">("a-zA-Z0-9_", [$.ExpRange("a", "z"), $.ExpRange("A", "Z"), $.ExpRange("0", "9"), $.ExpString("_")]));
export const FuncId: $.Parser<$ast.FuncId> = $.named("FunC identifier", $.loc($.field($.pure("FuncId"), "$", $.field($.opt($.regex<"." | "~">(".~", [$.ExpString("."), $.ExpString("~")])), "accessor", $.field($.stry($.alt($.right($.str("`"), $.right($.plus($.regex<"`" | "\r" | "\n">("^`\\r\\n", $.negateExps([$.ExpString("`"), $.ExpString("\r"), $.ExpString("\n")]))), $.right($.str("`"), $.eps))), $.plus($.regex<" " | "\t" | "\r" | "\n" | "(" | ")" | "[" | string | "," | "." | ";" | "~">("^ \\t\\r\\n()[\\],.;~", $.negateExps([$.ExpString(" "), $.ExpString("\t"), $.ExpString("\r"), $.ExpString("\n"), $.ExpString("("), $.ExpString(")"), $.ExpString("["), $.ExpString("\"\\]\""), $.ExpString(","), $.ExpString("."), $.ExpString(";"), $.ExpString("~")]))))), "id", $.eps)))));
export const hexDigit: $.Parser<$ast.hexDigit> = $.named("hexadecimal digit", $.regex<string | string | string>("0-9a-fA-F", [$.ExpRange("0", "9"), $.ExpRange("a", "f"), $.ExpRange("A", "F")]));
export const escapeChar: $.Parser<$ast.escapeChar> = $.alt($.regex<"\\" | "\"" | "n" | "r" | "t" | "v" | "b" | "f">("\\\\\"nrtvbf", [$.ExpString("\\"), $.ExpString("\""), $.ExpString("n"), $.ExpString("r"), $.ExpString("t"), $.ExpString("v"), $.ExpString("b"), $.ExpString("f")]), $.alt($.right($.str("u{"), $.left($.stry($.right(hexDigit, $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.eps))))))), $.str("}"))), $.alt($.right($.str("u"), $.stry($.right(hexDigit, $.right(hexDigit, $.right(hexDigit, $.right(hexDigit, $.eps)))))), $.right($.str("x"), $.stry($.right(hexDigit, $.right(hexDigit, $.eps)))))));
export const reservedWord: $.Parser<$ast.reservedWord> = $.named("reserved word", keyword($.alt($.str("extend"), $.alt($.str("public"), $.alt($.str("fun"), $.alt($.str("let"), $.alt($.str("return"), $.alt($.str("receive"), $.alt($.str("native"), $.alt($.str("primitive"), $.alt($.str("null"), $.alt($.str("if"), $.alt($.str("else"), $.alt($.str("while"), $.alt($.str("repeat"), $.alt($.str("do"), $.alt($.str("until"), $.alt($.str("try"), $.alt($.str("catch"), $.alt($.str("foreach"), $.alt($.str("as"), $.alt($.str("map"), $.alt($.str("mutates"), $.alt($.str("extends"), $.alt($.str("external"), $.alt($.str("import"), $.alt($.str("with"), $.alt($.str("trait"), $.alt($.str("initOf"), $.alt($.str("override"), $.alt($.str("abstract"), $.alt($.str("virtual"), $.alt($.str("inline"), $.str("const"))))))))))))))))))))))))))))))))));
export const space: $.Parser<$ast.space> = $.named("space", $.alt($.regex<" " | "\t" | "\r" | "\n">(" \\t\\r\\n", [$.ExpString(" "), $.ExpString("\t"), $.ExpString("\r"), $.ExpString("\n")]), comment));
export const JustImports: $.Parser<$ast.JustImports> = $.loc($.field($.pure("JustImports"), "$", $.field($.star(Import), "imports", $.right($.star($.any), $.eps))));