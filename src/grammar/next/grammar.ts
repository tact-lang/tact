/* eslint-disable @typescript-eslint/no-namespace */
/* eslint-disable @typescript-eslint/ban-types */
/* eslint-disable @typescript-eslint/no-redundant-type-constituents */
/* eslint-disable @typescript-eslint/no-duplicate-type-constituents */
import * as $ from "@langtools/runtime";
export namespace $$ {
  export type Module = $.Located<{
    readonly $: "Module";
    readonly imports: readonly Import[];
    readonly items: readonly moduleItem[];
  }>;
  export type Module$noSkip = $.Located<{
    readonly $: "Module";
    readonly imports: readonly Import$noSkip[];
    readonly items: readonly moduleItem$noSkip[];
  }>;
  export type Import = $.Located<{
    readonly $: "Import";
    readonly path: StringLiteral;
  }>;
  export type Import$noSkip = $.Located<{
    readonly $: "Import";
    readonly path: StringLiteral$noSkip;
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
    readonly instructions: readonly asmInstruction[];
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
  export type PrimitiveTypeDecl$noSkip = $.Located<{
    readonly $: "PrimitiveTypeDecl";
    readonly name: TypeId$noSkip;
  }>;
  export type $Function$noSkip = $.Located<{
    readonly $: "Function";
    readonly attributes: readonly FunctionAttribute$noSkip[];
    readonly name: Id$noSkip;
    readonly parameters: parametersFormal$noSkip;
    readonly returnType: ascription$noSkip | undefined;
    readonly body: FunctionDefinition$noSkip | FunctionDeclaration$noSkip;
  }>;
  export type AsmFunction$noSkip = $.Located<{
    readonly $: "AsmFunction";
    readonly shuffle: shuffle$noSkip | undefined;
    readonly attributes: readonly FunctionAttribute$noSkip[];
    readonly name: Id$noSkip;
    readonly parameters: parametersFormal$noSkip;
    readonly returnType: ascription$noSkip | undefined;
    readonly instructions: readonly asmInstruction$noSkip[];
  }>;
  export type NativeFunctionDecl$noSkip = $.Located<{
    readonly $: "NativeFunctionDecl";
    readonly nativeName: FuncId$noSkip;
    readonly attributes: readonly FunctionAttribute$noSkip[];
    readonly name: Id$noSkip;
    readonly parameters: parametersFormal$noSkip;
    readonly returnType: ascription$noSkip | undefined;
  }>;
  export type Constant$noSkip = $.Located<{
    readonly $: "Constant";
    readonly attributes: readonly ConstantAttribute$noSkip[];
    readonly name: Id$noSkip;
    readonly type: ascription$noSkip;
    readonly body: ConstantDefinition$noSkip | ConstantDeclaration$noSkip;
  }>;
  export type StructDecl$noSkip = $.Located<{
    readonly $: "StructDecl";
    readonly name: TypeId$noSkip;
    readonly fields: structFields$noSkip;
  }>;
  export type MessageDecl$noSkip = $.Located<{
    readonly $: "MessageDecl";
    readonly opcode: IntegerLiteral$noSkip | undefined;
    readonly name: TypeId$noSkip;
    readonly fields: structFields$noSkip;
  }>;
  export type Contract$noSkip = $.Located<{
    readonly $: "Contract";
    readonly attributes: readonly ContractAttribute$noSkip[];
    readonly name: Id$noSkip;
    readonly traits: inheritedTraits$noSkip | undefined;
    readonly declarations: readonly contractItemDecl$noSkip[];
  }>;
  export type Trait$noSkip = $.Located<{
    readonly $: "Trait";
    readonly attributes: readonly ContractAttribute$noSkip[];
    readonly name: Id$noSkip;
    readonly traits: inheritedTraits$noSkip | undefined;
    readonly declarations: readonly traitItemDecl$noSkip[];
  }>;
  export type moduleItem$noSkip = PrimitiveTypeDecl$noSkip | $Function$noSkip | AsmFunction$noSkip | NativeFunctionDecl$noSkip | Constant$noSkip | StructDecl$noSkip | MessageDecl$noSkip | Contract$noSkip | Trait$noSkip;
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
    readonly as: Id | undefined;
    readonly expression: expression | undefined;
  }>;
  export type multiLineComment$noSkip = string;
  export type singleLineComment$noSkip = string;
  export type comment$noSkip = multiLineComment$noSkip | singleLineComment$noSkip;
  export type space$noSkip = " " | "\t" | "\r" | "\n" | comment$noSkip;
  export type semicolon = ";" | "}";
  export type storageVar = FieldDecl;
  export type contractItemDecl = ContractInit | Receiver | $Function | Constant | storageVar;
  export type ContractInit$noSkip = $.Located<{
    readonly $: "ContractInit";
    readonly parameters: parametersFormal$noSkip;
    readonly body: statements$noSkip;
  }>;
  export type Receiver$noSkip = $.Located<{
    readonly $: "Receiver";
    readonly type: receiverType$noSkip;
    readonly param: receiverParam$noSkip;
    readonly body: statements$noSkip;
  }>;
  export type FieldDecl$noSkip = $.Located<{
    readonly $: "FieldDecl";
    readonly name: Id$noSkip;
    readonly type: ascription$noSkip;
    readonly as: Id$noSkip | undefined;
    readonly expression: expression$noSkip | undefined;
  }>;
  export type semicolon$noSkip = ";" | "}";
  export type storageVar$noSkip = FieldDecl$noSkip;
  export type contractItemDecl$noSkip = ContractInit$noSkip | Receiver$noSkip | $Function$noSkip | Constant$noSkip | storageVar$noSkip;
  export type traitItemDecl = Receiver | $Function | Constant | storageVar;
  export type traitItemDecl$noSkip = Receiver$noSkip | $Function$noSkip | Constant$noSkip | storageVar$noSkip;
  export type FunctionDefinition = $.Located<{
    readonly $: "FunctionDefinition";
    readonly body: statements;
  }>;
  export type FunctionDefinition$noSkip = $.Located<{
    readonly $: "FunctionDefinition";
    readonly body: statements$noSkip;
  }>;
  export type FunctionDeclaration = $.Located<{
    readonly $: "FunctionDeclaration";
  }>;
  export type FunctionDeclaration$noSkip = $.Located<{
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
  export type Id$noSkip = $.Located<{
    readonly $: "Id";
    readonly name: string;
  }>;
  export type IntegerLiteralDec$noSkip = $.Located<{
    readonly $: "IntegerLiteralDec";
    readonly digits: string;
  }>;
  export type shuffle$noSkip = {
    readonly ids: readonly Id$noSkip[];
    readonly to: readonly IntegerLiteralDec$noSkip[] | undefined;
  };
  export type ConstantAttribute = $.Located<{
    readonly $: "ConstantAttribute";
    readonly name: virtual | override | $abstract;
  }>;
  export type ConstantAttribute$noSkip = $.Located<{
    readonly $: "ConstantAttribute";
    readonly name: virtual$noSkip | override$noSkip | $abstract$noSkip;
  }>;
  export type ConstantDefinition = $.Located<{
    readonly $: "ConstantDefinition";
    readonly expression: expression;
  }>;
  export type ConstantDefinition$noSkip = $.Located<{
    readonly $: "ConstantDefinition";
    readonly expression: expression$noSkip;
  }>;
  export type ConstantDeclaration = $.Located<{
    readonly $: "ConstantDeclaration";
  }>;
  export type ConstantDeclaration$noSkip = $.Located<{
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
  export type inter$noSkip<A, B> = {
    readonly head: A;
    readonly tail: readonly {
      readonly op: B;
      readonly right: A;
    }[];
  };
  export type structFields$noSkip = inter$noSkip<FieldDecl$noSkip, ";"> | undefined;
  export type inheritedTraits = inter<Id, ",">;
  export type inheritedTraits$noSkip = inter$noSkip<Id$noSkip, ",">;
  export type ContractAttribute = $.Located<{
    readonly $: "ContractAttribute";
    readonly name: StringLiteral;
  }>;
  export type ContractAttribute$noSkip = $.Located<{
    readonly $: "ContractAttribute";
    readonly name: StringLiteral$noSkip;
  }>;
  export type FunctionAttribute = $.Located<{
    readonly $: "FunctionAttribute";
    readonly name: GetAttribute | mutates | $extends | virtual | override | inline | $abstract;
  }>;
  export type FunctionAttribute$noSkip = $.Located<{
    readonly $: "FunctionAttribute";
    readonly name: GetAttribute$noSkip | mutates$noSkip | $extends$noSkip | virtual$noSkip | override$noSkip | inline$noSkip | $abstract$noSkip;
  }>;
  export type GetAttribute = $.Located<{
    readonly $: "GetAttribute";
    readonly methodId: expression | undefined;
  }>;
  export type GetAttribute$noSkip = $.Located<{
    readonly $: "GetAttribute";
    readonly methodId: expression$noSkip | undefined;
  }>;
  export type idPart$noSkip = string | string | "_";
  export type receive = "receive";
  export type external = "external";
  export type receiverType = "bounced" | receive | external;
  export type receive$noSkip = "receive";
  export type external$noSkip = "external";
  export type receiverType$noSkip = "bounced" | receive$noSkip | external$noSkip;
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
  export type Parameter$noSkip = $.Located<{
    readonly $: "Parameter";
    readonly name: Id$noSkip;
    readonly type: ascription$noSkip;
  }>;
  export type StringLiteral$noSkip = $.Located<{
    readonly $: "StringLiteral";
    readonly value: string;
  }>;
  export type receiverParam$noSkip = Parameter$noSkip | StringLiteral$noSkip | undefined;
  export type hexDigit = string | string;
  export type asmData = {};
  export type multiLineComment = string;
  export type singleLineComment = string;
  export type comment = multiLineComment | singleLineComment;
  export type space = " " | "\t" | "\r" | "\n" | comment;
  export type asmAny = {};
  export type asmInstruction = string;
  export type hexDigit$noSkip = string | string;
  export type asmData$noSkip = {};
  export type asmAny$noSkip = {};
  export type asmInstruction$noSkip = string;
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
    readonly keyAs: Id | undefined;
    readonly value: TypeId;
    readonly valueAs: Id | undefined;
  }>;
  export type TypeBounced = $.Located<{
    readonly $: "TypeBounced";
    readonly child: TypeId;
  }>;
  export type $type = TypeOptional | TypeRegular | TypeMap | TypeBounced;
  export type ascription = $type;
  export type TypeOptional$noSkip = $.Located<{
    readonly $: "TypeOptional";
    readonly child: TypeId$noSkip;
  }>;
  export type TypeRegular$noSkip = $.Located<{
    readonly $: "TypeRegular";
    readonly child: TypeId$noSkip;
  }>;
  export type TypeMap$noSkip = $.Located<{
    readonly $: "TypeMap";
    readonly key: TypeId$noSkip;
    readonly keyAs: Id$noSkip | undefined;
    readonly value: TypeId$noSkip;
    readonly valueAs: Id$noSkip | undefined;
  }>;
  export type TypeBounced$noSkip = $.Located<{
    readonly $: "TypeBounced";
    readonly child: TypeId$noSkip;
  }>;
  export type $type$noSkip = TypeOptional$noSkip | TypeRegular$noSkip | TypeMap$noSkip | TypeBounced$noSkip;
  export type ascription$noSkip = $type$noSkip;
  export type TypeId = $.Located<{
    readonly $: "TypeId";
    readonly name: string;
  }>;
  export type TypeId$noSkip = $.Located<{
    readonly $: "TypeId";
    readonly name: string;
  }>;
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
    readonly operator: "-" | "+" | "*" | "/" | "%" | "|" | "&" | "^" | undefined;
    readonly right: expression;
  }>;
  export type statement = StatementLet | StatementBlock | StatementReturn | StatementCondition | StatementWhile | StatementRepeat | StatementUntil | StatementTry | StatementForEach | StatementExpression | StatementAssign;
  export type StatementLet$noSkip = $.Located<{
    readonly $: "StatementLet";
    readonly name: Id$noSkip;
    readonly type: ascription$noSkip | undefined;
    readonly init: expression$noSkip;
  }>;
  export type StatementBlock$noSkip = $.Located<{
    readonly $: "StatementBlock";
    readonly body: statements$noSkip;
  }>;
  export type StatementReturn$noSkip = $.Located<{
    readonly $: "StatementReturn";
    readonly expression: expression$noSkip | undefined;
  }>;
  export type StatementCondition$noSkip = $.Located<{
    readonly $: "StatementCondition";
    readonly condition: expression$noSkip;
    readonly trueBranch: statements$noSkip;
    readonly falseBranch: FalseBranch$noSkip | StatementCondition$noSkip | undefined;
  }>;
  export type StatementWhile$noSkip = $.Located<{
    readonly $: "StatementWhile";
    readonly condition: parens$noSkip;
    readonly body: statements$noSkip;
  }>;
  export type StatementRepeat$noSkip = $.Located<{
    readonly $: "StatementRepeat";
    readonly condition: parens$noSkip;
    readonly body: statements$noSkip;
  }>;
  export type StatementUntil$noSkip = $.Located<{
    readonly $: "StatementUntil";
    readonly body: statements$noSkip;
    readonly condition: parens$noSkip;
  }>;
  export type StatementTry$noSkip = $.Located<{
    readonly $: "StatementTry";
    readonly body: statements$noSkip;
    readonly handler: {
      readonly name: Id$noSkip;
      readonly body: statements$noSkip;
    } | undefined;
  }>;
  export type StatementForEach$noSkip = $.Located<{
    readonly $: "StatementForEach";
    readonly key: Id$noSkip;
    readonly value: Id$noSkip;
    readonly expression: expression$noSkip;
    readonly body: statements$noSkip;
  }>;
  export type StatementExpression$noSkip = $.Located<{
    readonly $: "StatementExpression";
    readonly expression: expression$noSkip;
  }>;
  export type StatementAssign$noSkip = $.Located<{
    readonly $: "StatementAssign";
    readonly left: expression$noSkip;
    readonly operator: "-" | "+" | "*" | "/" | "%" | "|" | "&" | "^" | undefined;
    readonly right: expression$noSkip;
  }>;
  export type statement$noSkip = StatementLet$noSkip | StatementBlock$noSkip | StatementReturn$noSkip | StatementCondition$noSkip | StatementWhile$noSkip | StatementRepeat$noSkip | StatementUntil$noSkip | StatementTry$noSkip | StatementForEach$noSkip | StatementExpression$noSkip | StatementAssign$noSkip;
  export type statements = readonly statement[];
  export type statements$noSkip = readonly statement$noSkip[];
  export type FalseBranch = $.Located<{
    readonly $: "FalseBranch";
    readonly body: statements;
  }>;
  export type FalseBranch$noSkip = $.Located<{
    readonly $: "FalseBranch";
    readonly body: statements$noSkip;
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
  export type Conditional$noSkip = $.Located<{
    readonly $: "Conditional";
    readonly head: or$noSkip;
    readonly tail: {
      readonly thenBranch: or$noSkip;
      readonly elseBranch: Conditional$noSkip;
    } | undefined;
  }>;
  export type expression$noSkip = Conditional$noSkip;
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
  export type Binary$noSkip<T, U> = $.Located<{
    readonly $: "Binary";
    readonly exprs: inter$noSkip<T, Operator$noSkip<U>>;
  }>;
  export type Unary$noSkip = $.Located<{
    readonly $: "Unary";
    readonly prefixes: readonly Operator$noSkip<"-" | "+" | "!" | "~">[];
    readonly expression: Suffix$noSkip;
  }>;
  export type mul$noSkip = Binary$noSkip<Unary$noSkip, "*" | "/" | "%">;
  export type add$noSkip = Binary$noSkip<mul$noSkip, "+" | "-">;
  export type bitwiseShift$noSkip = Binary$noSkip<add$noSkip, "<<" | ">>">;
  export type compare$noSkip = Binary$noSkip<bitwiseShift$noSkip, "<=" | "<" | ">=" | ">">;
  export type equality$noSkip = Binary$noSkip<compare$noSkip, "!=" | "==">;
  export type bitwiseAnd$noSkip = Binary$noSkip<equality$noSkip, "&">;
  export type bitwiseXor$noSkip = Binary$noSkip<bitwiseAnd$noSkip, "^">;
  export type bitwiseOr$noSkip = Binary$noSkip<bitwiseXor$noSkip, "|">;
  export type and$noSkip = Binary$noSkip<bitwiseOr$noSkip, "&&">;
  export type or$noSkip = Binary$noSkip<and$noSkip, "||">;
  export type Suffix = $.Located<{
    readonly $: "Suffix";
    readonly expression: primary;
    readonly suffixes: readonly suffix[];
  }>;
  export type Suffix$noSkip = $.Located<{
    readonly $: "Suffix";
    readonly expression: primary$noSkip;
    readonly suffixes: readonly suffix$noSkip[];
  }>;
  export type Operator<U> = $.Located<{
    readonly $: "Operator";
    readonly name: U;
  }>;
  export type Operator$noSkip<U> = $.Located<{
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
  export type SuffixUnboxNotNull$noSkip = $.Located<{
    readonly $: "SuffixUnboxNotNull";
  }>;
  export type SuffixCall$noSkip = $.Located<{
    readonly $: "SuffixCall";
    readonly params: parametersPassed$noSkip;
  }>;
  export type SuffixFieldAccess$noSkip = $.Located<{
    readonly $: "SuffixFieldAccess";
    readonly name: Id$noSkip;
  }>;
  export type suffix$noSkip = SuffixUnboxNotNull$noSkip | SuffixCall$noSkip | SuffixFieldAccess$noSkip;
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
  export type Parens$noSkip = $.Located<{
    readonly $: "Parens";
    readonly child: parens$noSkip;
  }>;
  export type StructInstance$noSkip = $.Located<{
    readonly $: "StructInstance";
    readonly type: TypeId$noSkip;
    readonly fields: inter$noSkip<StructFieldInitializer$noSkip, ","> | undefined;
  }>;
  export type IntegerLiteral$noSkip = $.Located<{
    readonly $: "IntegerLiteral";
    readonly value: IntegerLiteralHex$noSkip | IntegerLiteralBin$noSkip | IntegerLiteralOct$noSkip | IntegerLiteralDec$noSkip;
  }>;
  export type BoolLiteral$noSkip = $.Located<{
    readonly $: "BoolLiteral";
    readonly value: "true" | "false";
  }>;
  export type InitOf$noSkip = $.Located<{
    readonly $: "InitOf";
    readonly name: Id$noSkip;
    readonly params: parametersPassed$noSkip;
  }>;
  export type Null$noSkip = $.Located<{
    readonly $: "Null";
  }>;
  export type primary$noSkip = Parens$noSkip | StructInstance$noSkip | IntegerLiteral$noSkip | BoolLiteral$noSkip | InitOf$noSkip | Null$noSkip | StringLiteral$noSkip | Id$noSkip;
  export type parens = expression;
  export type parens$noSkip = expression$noSkip;
  export type StructFieldInitializer = $.Located<{
    readonly $: "StructFieldInitializer";
    readonly name: Id;
    readonly init: expression | undefined;
  }>;
  export type StructFieldInitializer$noSkip = $.Located<{
    readonly $: "StructFieldInitializer";
    readonly name: Id$noSkip;
    readonly init: expression$noSkip | undefined;
  }>;
  export type parametersPassed = inter<expression, ","> | undefined;
  export type parametersPassed$noSkip = inter$noSkip<expression$noSkip, ","> | undefined;
  export type parametersFormal = inter<Parameter, ","> | undefined;
  export type parametersFormal$noSkip = inter$noSkip<Parameter$noSkip, ","> | undefined;
  export type IntegerLiteralHex = $.Located<{
    readonly $: "IntegerLiteralHex";
    readonly digits: string;
  }>;
  export type IntegerLiteralHex$noSkip = $.Located<{
    readonly $: "IntegerLiteralHex";
    readonly digits: string;
  }>;
  export type IntegerLiteralBin = $.Located<{
    readonly $: "IntegerLiteralBin";
    readonly digits: string;
  }>;
  export type IntegerLiteralBin$noSkip = $.Located<{
    readonly $: "IntegerLiteralBin";
    readonly digits: string;
  }>;
  export type IntegerLiteralOct = $.Located<{
    readonly $: "IntegerLiteralOct";
    readonly digits: string;
  }>;
  export type IntegerLiteralOct$noSkip = $.Located<{
    readonly $: "IntegerLiteralOct";
    readonly digits: string;
  }>;
  export type idPart = string | string | "_";
  export type notUnderscore = "_";
  export type notArithOperator = "+" | "-" | "*" | "/%" | "/" | "%" | "~/" | "^/" | "~%" | "^%";
  export type notComparisonOperator = "<=>" | "<=" | "<" | ">=" | ">" | "!=" | "==";
  export type notBitwiseOperator = "~>>" | "~" | "^>>" | "^" | "&" | "|" | "<<" | ">>";
  export type notAssignOperator = "=" | "+=" | "-=" | "*=" | "/=" | "%=" | "~>>=" | "~/=" | "~%=" | "^>>=" | "^/=" | "^%=" | "^=" | "<<=" | ">>=" | "&=" | "|=";
  export type notDelimiter = "[" | "]" | "{" | "}" | "?" | ":";
  export type notControlKeyword = "return" | "var" | "repeat" | "do" | "while" | "until" | "try" | "catch" | "ifnot" | "if" | "then" | "elseifnot" | "elseif" | "else";
  export type notTypeKeyword = "int" | "cell" | "builder" | "slice" | "cont" | "tuple" | "type" | "->" | "forall";
  export type notKeyword = "extern" | "global" | "asm" | "impure" | "inline_ref" | "inline" | "auto_apply" | "method_id" | "operator" | "infixl" | "infixr" | "infix" | "const";
  export type notDirective = "#include" | "#pragma";
  export type digit = string;
  export type notDecimalNumber = string;
  export type notHexadecimalNumber = string;
  export type funcInvalidId = notUnderscore | notArithOperator | notComparisonOperator | notBitwiseOperator | notAssignOperator | notDelimiter | notControlKeyword | notTypeKeyword | notKeyword | notDirective | notDecimalNumber | notHexadecimalNumber;
  export type notUnderscore$noSkip = "_";
  export type notArithOperator$noSkip = "+" | "-" | "*" | "/%" | "/" | "%" | "~/" | "^/" | "~%" | "^%";
  export type notComparisonOperator$noSkip = "<=>" | "<=" | "<" | ">=" | ">" | "!=" | "==";
  export type notBitwiseOperator$noSkip = "~>>" | "~" | "^>>" | "^" | "&" | "|" | "<<" | ">>";
  export type notAssignOperator$noSkip = "=" | "+=" | "-=" | "*=" | "/=" | "%=" | "~>>=" | "~/=" | "~%=" | "^>>=" | "^/=" | "^%=" | "^=" | "<<=" | ">>=" | "&=" | "|=";
  export type notDelimiter$noSkip = "[" | "]" | "{" | "}" | "?" | ":";
  export type notControlKeyword$noSkip = "return" | "var" | "repeat" | "do" | "while" | "until" | "try" | "catch" | "ifnot" | "if" | "then" | "elseifnot" | "elseif" | "else";
  export type notTypeKeyword$noSkip = "int" | "cell" | "builder" | "slice" | "cont" | "tuple" | "type" | "->" | "forall";
  export type notKeyword$noSkip = "extern" | "global" | "asm" | "impure" | "inline_ref" | "inline" | "auto_apply" | "method_id" | "operator" | "infixl" | "infixr" | "infix" | "const";
  export type notDirective$noSkip = "#include" | "#pragma";
  export type digit$noSkip = string;
  export type notDecimalNumber$noSkip = string;
  export type notHexadecimalNumber$noSkip = string;
  export type funcInvalidId$noSkip = notUnderscore$noSkip | notArithOperator$noSkip | notComparisonOperator$noSkip | notBitwiseOperator$noSkip | notAssignOperator$noSkip | notDelimiter$noSkip | notControlKeyword$noSkip | notTypeKeyword$noSkip | notKeyword$noSkip | notDirective$noSkip | notDecimalNumber$noSkip | notHexadecimalNumber$noSkip;
  export type whiteSpace = " " | "\t" | "\r" | "\n";
  export type funcPlainId = string;
  export type whiteSpace$noSkip = " " | "\t" | "\r" | "\n";
  export type funcPlainId$noSkip = string;
  export type funcQuotedId = string;
  export type funcQuotedId$noSkip = string;
  export type FuncId = $.Located<{
    readonly $: "FuncId";
    readonly accessor: "." | "~" | undefined;
    readonly id: funcQuotedId | funcPlainId;
  }>;
  export type FuncId$noSkip = $.Located<{
    readonly $: "FuncId";
    readonly accessor: "." | "~" | undefined;
    readonly id: funcQuotedId$noSkip | funcPlainId$noSkip;
  }>;
  export type escapeChar = "\\" | "\"" | "n" | "r" | "t" | "v" | "b" | "f" | string | string | string;
  export type escapeChar$noSkip = "\\" | "\"" | "n" | "r" | "t" | "v" | "b" | "f" | string | string | string;
  export type fun = "fun";
  export type $let = "let";
  export type $return = "return";
  export type extend = "extend";
  export type $native = "native";
  export type primitive = "primitive";
  export type $public = "public";
  export type $null = "null";
  export type $if = "if";
  export type $else = "else";
  export type $while = "while";
  export type repeat = "repeat";
  export type $do = "do";
  export type until = "until";
  export type $try = "try";
  export type $catch = "catch";
  export type foreach = "foreach";
  export type $as = "as";
  export type map = "map";
  export type mutates = "mutates";
  export type $extends = "extends";
  export type $import = "import";
  export type $with = "with";
  export type trait = "trait";
  export type initOf = "initOf";
  export type override = "override";
  export type $abstract = "abstract";
  export type virtual = "virtual";
  export type inline = "inline";
  export type $const = "const";
  export type keyword = fun | $let | $return | receive | extend | $native | primitive | $public | $null | $if | $else | $while | repeat | $do | until | $try | $catch | foreach | $as | map | mutates | $extends | external | $import | $with | trait | initOf | override | $abstract | virtual | inline | $const;
  export type reservedWord = keyword;
  export type fun$noSkip = "fun";
  export type $let$noSkip = "let";
  export type $return$noSkip = "return";
  export type extend$noSkip = "extend";
  export type $native$noSkip = "native";
  export type primitive$noSkip = "primitive";
  export type $public$noSkip = "public";
  export type $null$noSkip = "null";
  export type $if$noSkip = "if";
  export type $else$noSkip = "else";
  export type $while$noSkip = "while";
  export type repeat$noSkip = "repeat";
  export type $do$noSkip = "do";
  export type until$noSkip = "until";
  export type $try$noSkip = "try";
  export type $catch$noSkip = "catch";
  export type foreach$noSkip = "foreach";
  export type $as$noSkip = "as";
  export type map$noSkip = "map";
  export type mutates$noSkip = "mutates";
  export type $extends$noSkip = "extends";
  export type $import$noSkip = "import";
  export type $with$noSkip = "with";
  export type trait$noSkip = "trait";
  export type initOf$noSkip = "initOf";
  export type override$noSkip = "override";
  export type $abstract$noSkip = "abstract";
  export type virtual$noSkip = "virtual";
  export type inline$noSkip = "inline";
  export type $const$noSkip = "const";
  export type keyword$noSkip = fun$noSkip | $let$noSkip | $return$noSkip | receive$noSkip | extend$noSkip | $native$noSkip | primitive$noSkip | $public$noSkip | $null$noSkip | $if$noSkip | $else$noSkip | $while$noSkip | repeat$noSkip | $do$noSkip | until$noSkip | $try$noSkip | $catch$noSkip | foreach$noSkip | $as$noSkip | map$noSkip | mutates$noSkip | $extends$noSkip | external$noSkip | $import$noSkip | $with$noSkip | trait$noSkip | initOf$noSkip | override$noSkip | $abstract$noSkip | virtual$noSkip | inline$noSkip | $const$noSkip;
  export type reservedWord$noSkip = keyword$noSkip;
  export type contract = "contract";
  export type contract$noSkip = "contract";
  export type JustImports = $.Located<{
    readonly $: "JustImports";
    readonly imports: readonly Import[];
  }>;
  export type JustImports$noSkip = $.Located<{
    readonly $: "JustImports";
    readonly imports: readonly Import$noSkip[];
  }>;
}
export const Module: $.Parser<$$.Module> = $.loc($.field($.pure("Module"), "$", $.right($.star($.ref(() => space)), $.field($.star($.ref(() => Import)), "imports", $.field($.star($.ref(() => moduleItem)), "items", $.right($.lookNeg($.left($.any, $.star($.ref(() => space$noSkip)))), $.eps))))));
export const Module$noSkip: $.Parser<$$.Module$noSkip> = $.loc($.field($.pure("Module"), "$", $.right($.star($.ref(() => space$noSkip)), $.field($.star($.ref(() => Import$noSkip)), "imports", $.field($.star($.ref(() => moduleItem$noSkip)), "items", $.right($.lookNeg($.any), $.eps))))));
export const Import: $.Parser<$$.Import> = $.loc($.field($.pure("Import"), "$", $.right($.ref(() => $import), $.field($.ref(() => StringLiteral), "path", $.right($.left($.str(";"), $.star($.ref(() => space$noSkip))), $.eps)))));
export const Import$noSkip: $.Parser<$$.Import$noSkip> = $.loc($.field($.pure("Import"), "$", $.right($.ref(() => $import$noSkip), $.field($.ref(() => StringLiteral$noSkip), "path", $.right($.str(";"), $.eps)))));
export const PrimitiveTypeDecl: $.Parser<$$.PrimitiveTypeDecl> = $.loc($.field($.pure("PrimitiveTypeDecl"), "$", $.right($.ref(() => primitive), $.field($.ref(() => TypeId), "name", $.right($.left($.str(";"), $.star($.ref(() => space$noSkip))), $.eps)))));
export const $Function: $.Parser<$$.$Function> = $.loc($.field($.pure("Function"), "$", $.field($.star($.ref(() => FunctionAttribute)), "attributes", $.right($.ref(() => fun), $.field($.ref(() => Id), "name", $.field($.ref(() => parametersFormal), "parameters", $.field($.opt($.ref(() => ascription)), "returnType", $.field($.alt($.ref(() => FunctionDefinition), $.ref(() => FunctionDeclaration)), "body", $.eps))))))));
export const AsmFunction: $.Parser<$$.AsmFunction> = $.loc($.field($.pure("AsmFunction"), "$", $.right($.left($.str("asm"), $.star($.ref(() => space$noSkip))), $.field($.opt($.ref(() => shuffle)), "shuffle", $.field($.star($.ref(() => FunctionAttribute)), "attributes", $.right($.ref(() => fun), $.field($.ref(() => Id), "name", $.field($.ref(() => parametersFormal), "parameters", $.field($.opt($.ref(() => ascription)), "returnType", $.right($.left($.str("{"), $.star($.ref(() => space$noSkip))), $.field($.plus($.ref(() => asmInstruction)), "instructions", $.right($.left($.str("}"), $.star($.ref(() => space$noSkip))), $.eps))))))))))));
export const NativeFunctionDecl: $.Parser<$$.NativeFunctionDecl> = $.loc($.field($.pure("NativeFunctionDecl"), "$", $.right($.left($.str("@name"), $.star($.ref(() => space$noSkip))), $.right($.left($.str("("), $.star($.ref(() => space$noSkip))), $.field($.ref(() => FuncId), "nativeName", $.right($.left($.str(")"), $.star($.ref(() => space$noSkip))), $.field($.star($.ref(() => FunctionAttribute)), "attributes", $.right($.ref(() => $native), $.field($.ref(() => Id), "name", $.field($.ref(() => parametersFormal), "parameters", $.field($.opt($.ref(() => ascription)), "returnType", $.right($.left($.str(";"), $.star($.ref(() => space$noSkip))), $.eps))))))))))));
export const Constant: $.Parser<$$.Constant> = $.loc($.field($.pure("Constant"), "$", $.field($.star($.ref(() => ConstantAttribute)), "attributes", $.right($.ref(() => $const), $.field($.ref(() => Id), "name", $.field($.ref(() => ascription), "type", $.field($.alt($.ref(() => ConstantDefinition), $.ref(() => ConstantDeclaration)), "body", $.eps)))))));
export const StructDecl: $.Parser<$$.StructDecl> = $.loc($.field($.pure("StructDecl"), "$", $.right($.left($.str("struct"), $.star($.ref(() => space$noSkip))), $.field($.ref(() => TypeId), "name", $.right($.left($.str("{"), $.star($.ref(() => space$noSkip))), $.field($.ref(() => structFields), "fields", $.right($.left($.str("}"), $.star($.ref(() => space$noSkip))), $.eps)))))));
export const MessageDecl: $.Parser<$$.MessageDecl> = $.loc($.field($.pure("MessageDecl"), "$", $.right($.left($.str("message"), $.star($.ref(() => space$noSkip))), $.field($.opt($.right($.left($.str("("), $.star($.ref(() => space$noSkip))), $.left($.ref(() => IntegerLiteral), $.left($.str(")"), $.star($.ref(() => space$noSkip)))))), "opcode", $.field($.ref(() => TypeId), "name", $.right($.left($.str("{"), $.star($.ref(() => space$noSkip))), $.field($.ref(() => structFields), "fields", $.right($.left($.str("}"), $.star($.ref(() => space$noSkip))), $.eps))))))));
export const Contract: $.Parser<$$.Contract> = $.loc($.field($.pure("Contract"), "$", $.field($.star($.ref(() => ContractAttribute)), "attributes", $.right($.ref(() => contract), $.field($.ref(() => Id), "name", $.field($.opt($.right($.ref(() => $with), $.ref(() => inheritedTraits))), "traits", $.right($.left($.str("{"), $.star($.ref(() => space$noSkip))), $.field($.star($.ref(() => contractItemDecl)), "declarations", $.right($.left($.str("}"), $.star($.ref(() => space$noSkip))), $.eps)))))))));
export const Trait: $.Parser<$$.Trait> = $.loc($.field($.pure("Trait"), "$", $.field($.star($.ref(() => ContractAttribute)), "attributes", $.right($.ref(() => trait), $.field($.ref(() => Id), "name", $.field($.opt($.right($.ref(() => $with), $.ref(() => inheritedTraits))), "traits", $.right($.left($.str("{"), $.star($.ref(() => space$noSkip))), $.field($.star($.ref(() => traitItemDecl)), "declarations", $.right($.left($.str("}"), $.star($.ref(() => space$noSkip))), $.eps)))))))));
export const moduleItem: $.Parser<$$.moduleItem> = $.alt(PrimitiveTypeDecl, $.alt($Function, $.alt(AsmFunction, $.alt(NativeFunctionDecl, $.alt(Constant, $.alt(StructDecl, $.alt(MessageDecl, $.alt(Contract, Trait))))))));
export const PrimitiveTypeDecl$noSkip: $.Parser<$$.PrimitiveTypeDecl$noSkip> = $.loc($.field($.pure("PrimitiveTypeDecl"), "$", $.right($.ref(() => primitive$noSkip), $.field($.ref(() => TypeId$noSkip), "name", $.right($.str(";"), $.eps)))));
export const $Function$noSkip: $.Parser<$$.$Function$noSkip> = $.loc($.field($.pure("Function"), "$", $.field($.star($.ref(() => FunctionAttribute$noSkip)), "attributes", $.right($.ref(() => fun$noSkip), $.field($.ref(() => Id$noSkip), "name", $.field($.ref(() => parametersFormal$noSkip), "parameters", $.field($.opt($.ref(() => ascription$noSkip)), "returnType", $.field($.alt($.ref(() => FunctionDefinition$noSkip), $.ref(() => FunctionDeclaration$noSkip)), "body", $.eps))))))));
export const AsmFunction$noSkip: $.Parser<$$.AsmFunction$noSkip> = $.loc($.field($.pure("AsmFunction"), "$", $.right($.str("asm"), $.field($.opt($.ref(() => shuffle$noSkip)), "shuffle", $.field($.star($.ref(() => FunctionAttribute$noSkip)), "attributes", $.right($.ref(() => fun$noSkip), $.field($.ref(() => Id$noSkip), "name", $.field($.ref(() => parametersFormal$noSkip), "parameters", $.field($.opt($.ref(() => ascription$noSkip)), "returnType", $.right($.str("{"), $.field($.plus($.ref(() => asmInstruction$noSkip)), "instructions", $.right($.str("}"), $.eps))))))))))));
export const NativeFunctionDecl$noSkip: $.Parser<$$.NativeFunctionDecl$noSkip> = $.loc($.field($.pure("NativeFunctionDecl"), "$", $.right($.str("@name"), $.right($.str("("), $.field($.ref(() => FuncId$noSkip), "nativeName", $.right($.str(")"), $.field($.star($.ref(() => FunctionAttribute$noSkip)), "attributes", $.right($.ref(() => $native$noSkip), $.field($.ref(() => Id$noSkip), "name", $.field($.ref(() => parametersFormal$noSkip), "parameters", $.field($.opt($.ref(() => ascription$noSkip)), "returnType", $.right($.str(";"), $.eps))))))))))));
export const Constant$noSkip: $.Parser<$$.Constant$noSkip> = $.loc($.field($.pure("Constant"), "$", $.field($.star($.ref(() => ConstantAttribute$noSkip)), "attributes", $.right($.ref(() => $const$noSkip), $.field($.ref(() => Id$noSkip), "name", $.field($.ref(() => ascription$noSkip), "type", $.field($.alt($.ref(() => ConstantDefinition$noSkip), $.ref(() => ConstantDeclaration$noSkip)), "body", $.eps)))))));
export const StructDecl$noSkip: $.Parser<$$.StructDecl$noSkip> = $.loc($.field($.pure("StructDecl"), "$", $.right($.str("struct"), $.field($.ref(() => TypeId$noSkip), "name", $.right($.str("{"), $.field($.ref(() => structFields$noSkip), "fields", $.right($.str("}"), $.eps)))))));
export const MessageDecl$noSkip: $.Parser<$$.MessageDecl$noSkip> = $.loc($.field($.pure("MessageDecl"), "$", $.right($.str("message"), $.field($.opt($.right($.str("("), $.left($.ref(() => IntegerLiteral$noSkip), $.str(")")))), "opcode", $.field($.ref(() => TypeId$noSkip), "name", $.right($.str("{"), $.field($.ref(() => structFields$noSkip), "fields", $.right($.str("}"), $.eps))))))));
export const Contract$noSkip: $.Parser<$$.Contract$noSkip> = $.loc($.field($.pure("Contract"), "$", $.field($.star($.ref(() => ContractAttribute$noSkip)), "attributes", $.right($.ref(() => contract$noSkip), $.field($.ref(() => Id$noSkip), "name", $.field($.opt($.right($.ref(() => $with$noSkip), $.ref(() => inheritedTraits$noSkip))), "traits", $.right($.str("{"), $.field($.star($.ref(() => contractItemDecl$noSkip)), "declarations", $.right($.str("}"), $.eps)))))))));
export const Trait$noSkip: $.Parser<$$.Trait$noSkip> = $.loc($.field($.pure("Trait"), "$", $.field($.star($.ref(() => ContractAttribute$noSkip)), "attributes", $.right($.ref(() => trait$noSkip), $.field($.ref(() => Id$noSkip), "name", $.field($.opt($.right($.ref(() => $with$noSkip), $.ref(() => inheritedTraits$noSkip))), "traits", $.right($.str("{"), $.field($.star($.ref(() => traitItemDecl$noSkip)), "declarations", $.right($.str("}"), $.eps)))))))));
export const moduleItem$noSkip: $.Parser<$$.moduleItem$noSkip> = $.alt(PrimitiveTypeDecl$noSkip, $.alt($Function$noSkip, $.alt(AsmFunction$noSkip, $.alt(NativeFunctionDecl$noSkip, $.alt(Constant$noSkip, $.alt(StructDecl$noSkip, $.alt(MessageDecl$noSkip, $.alt(Contract$noSkip, Trait$noSkip))))))));
export const ContractInit: $.Parser<$$.ContractInit> = $.loc($.field($.pure("ContractInit"), "$", $.right($.left($.str("init"), $.star($.ref(() => space$noSkip))), $.field($.ref(() => parametersFormal), "parameters", $.field($.ref(() => statements), "body", $.eps)))));
export const Receiver: $.Parser<$$.Receiver> = $.loc($.field($.pure("Receiver"), "$", $.field($.ref(() => receiverType), "type", $.right($.left($.str("("), $.star($.ref(() => space$noSkip))), $.field($.ref(() => receiverParam), "param", $.right($.left($.str(")"), $.star($.ref(() => space$noSkip))), $.field($.ref(() => statements), "body", $.eps)))))));
export const FieldDecl: $.Parser<$$.FieldDecl> = $.loc($.field($.pure("FieldDecl"), "$", $.field($.ref(() => Id), "name", $.field($.ref(() => ascription), "type", $.field($.opt($.right($.ref(() => $as), $.ref(() => Id))), "as", $.field($.opt($.right($.left($.str("="), $.star($.ref(() => space$noSkip))), $.ref(() => expression))), "expression", $.eps))))));
export const multiLineComment$noSkip: $.Parser<$$.multiLineComment$noSkip> = $.right($.str("/*"), $.left($.stry($.star($.right($.lookNeg($.str("*/")), $.right($.any, $.eps)))), $.str("*/")));
export const singleLineComment$noSkip: $.Parser<$$.singleLineComment$noSkip> = $.right($.str("//"), $.stry($.star($.regex<"\r" | "\n">("^\\r\\n", false))));
export const comment$noSkip: $.Parser<$$.comment$noSkip> = $.alt(multiLineComment$noSkip, singleLineComment$noSkip);
export const space$noSkip: $.Parser<$$.space$noSkip> = $.alt($.regex<" " | "\t" | "\r" | "\n">(" \\t\\r\\n", false), comment$noSkip);
export const semicolon: $.Parser<$$.semicolon> = $.alt($.left($.str(";"), $.star(space$noSkip)), $.lookPos($.left($.str("}"), $.star(space$noSkip))));
export const storageVar: $.Parser<$$.storageVar> = $.left(FieldDecl, semicolon);
export const contractItemDecl: $.Parser<$$.contractItemDecl> = $.alt(ContractInit, $.alt(Receiver, $.alt($Function, $.alt(Constant, storageVar))));
export const ContractInit$noSkip: $.Parser<$$.ContractInit$noSkip> = $.loc($.field($.pure("ContractInit"), "$", $.right($.str("init"), $.field($.ref(() => parametersFormal$noSkip), "parameters", $.field($.ref(() => statements$noSkip), "body", $.eps)))));
export const Receiver$noSkip: $.Parser<$$.Receiver$noSkip> = $.loc($.field($.pure("Receiver"), "$", $.field($.ref(() => receiverType$noSkip), "type", $.right($.str("("), $.field($.ref(() => receiverParam$noSkip), "param", $.right($.str(")"), $.field($.ref(() => statements$noSkip), "body", $.eps)))))));
export const FieldDecl$noSkip: $.Parser<$$.FieldDecl$noSkip> = $.loc($.field($.pure("FieldDecl"), "$", $.field($.ref(() => Id$noSkip), "name", $.field($.ref(() => ascription$noSkip), "type", $.field($.opt($.right($.ref(() => $as$noSkip), $.ref(() => Id$noSkip))), "as", $.field($.opt($.right($.str("="), $.ref(() => expression$noSkip))), "expression", $.eps))))));
export const semicolon$noSkip: $.Parser<$$.semicolon$noSkip> = $.alt($.str(";"), $.lookPos($.str("}")));
export const storageVar$noSkip: $.Parser<$$.storageVar$noSkip> = $.left(FieldDecl$noSkip, semicolon$noSkip);
export const contractItemDecl$noSkip: $.Parser<$$.contractItemDecl$noSkip> = $.alt(ContractInit$noSkip, $.alt(Receiver$noSkip, $.alt($Function$noSkip, $.alt(Constant$noSkip, storageVar$noSkip))));
export const traitItemDecl: $.Parser<$$.traitItemDecl> = $.alt(Receiver, $.alt($Function, $.alt(Constant, storageVar)));
export const traitItemDecl$noSkip: $.Parser<$$.traitItemDecl$noSkip> = $.alt(Receiver$noSkip, $.alt($Function$noSkip, $.alt(Constant$noSkip, storageVar$noSkip)));
export const FunctionDefinition: $.Parser<$$.FunctionDefinition> = $.loc($.field($.pure("FunctionDefinition"), "$", $.field($.ref(() => statements), "body", $.eps)));
export const FunctionDefinition$noSkip: $.Parser<$$.FunctionDefinition$noSkip> = $.loc($.field($.pure("FunctionDefinition"), "$", $.field($.ref(() => statements$noSkip), "body", $.eps)));
export const FunctionDeclaration: $.Parser<$$.FunctionDeclaration> = $.loc($.field($.pure("FunctionDeclaration"), "$", $.right($.stry(semicolon), $.eps)));
export const FunctionDeclaration$noSkip: $.Parser<$$.FunctionDeclaration$noSkip> = $.loc($.field($.pure("FunctionDeclaration"), "$", $.right($.stry(semicolon$noSkip), $.eps)));
export const Id: $.Parser<$$.Id> = $.loc($.field($.pure("Id"), "$", $.field($.left($.stry($.right($.lookNeg($.ref(() => reservedWord$noSkip)), $.right($.regex<string | "_">("a-z_", true), $.right($.star($.ref(() => idPart$noSkip)), $.eps)))), $.star(space$noSkip)), "name", $.eps)));
export const IntegerLiteralDec: $.Parser<$$.IntegerLiteralDec> = $.loc($.field($.pure("IntegerLiteralDec"), "$", $.field($.stry($.alt($.right($.left($.regex<string>("1-9", false), $.star(space$noSkip)), $.right($.star($.right($.opt($.left($.str("_"), $.star(space$noSkip))), $.right($.ref(() => digit), $.eps))), $.eps)), $.right($.left($.str("0"), $.star(space$noSkip)), $.right($.star($.ref(() => digit)), $.eps)))), "digits", $.eps)));
export const shuffle: $.Parser<$$.shuffle> = $.right($.left($.str("("), $.star(space$noSkip)), $.field($.star(Id), "ids", $.field($.opt($.right($.left($.str("->"), $.star(space$noSkip)), $.plus(IntegerLiteralDec))), "to", $.right($.left($.str(")"), $.star(space$noSkip)), $.eps))));
export const Id$noSkip: $.Parser<$$.Id$noSkip> = $.loc($.field($.pure("Id"), "$", $.field($.stry($.right($.lookNeg($.ref(() => reservedWord$noSkip)), $.right($.regex<string | "_">("a-z_", true), $.right($.star($.ref(() => idPart$noSkip)), $.eps)))), "name", $.eps)));
export const IntegerLiteralDec$noSkip: $.Parser<$$.IntegerLiteralDec$noSkip> = $.loc($.field($.pure("IntegerLiteralDec"), "$", $.field($.stry($.alt($.right($.regex<string>("1-9", false), $.right($.star($.right($.opt($.str("_")), $.right($.ref(() => digit$noSkip), $.eps))), $.eps)), $.right($.str("0"), $.right($.star($.ref(() => digit$noSkip)), $.eps)))), "digits", $.eps)));
export const shuffle$noSkip: $.Parser<$$.shuffle$noSkip> = $.right($.str("("), $.field($.star(Id$noSkip), "ids", $.field($.opt($.right($.str("->"), $.plus(IntegerLiteralDec$noSkip))), "to", $.right($.str(")"), $.eps))));
export const ConstantAttribute: $.Parser<$$.ConstantAttribute> = $.loc($.field($.pure("ConstantAttribute"), "$", $.field($.alt($.ref(() => virtual), $.alt($.ref(() => override), $.ref(() => $abstract))), "name", $.eps)));
export const ConstantAttribute$noSkip: $.Parser<$$.ConstantAttribute$noSkip> = $.loc($.field($.pure("ConstantAttribute"), "$", $.field($.alt($.ref(() => virtual$noSkip), $.alt($.ref(() => override$noSkip), $.ref(() => $abstract$noSkip))), "name", $.eps)));
export const ConstantDefinition: $.Parser<$$.ConstantDefinition> = $.loc($.field($.pure("ConstantDefinition"), "$", $.right($.left($.str("="), $.star(space$noSkip)), $.field($.ref(() => expression), "expression", $.right(semicolon, $.eps)))));
export const ConstantDefinition$noSkip: $.Parser<$$.ConstantDefinition$noSkip> = $.loc($.field($.pure("ConstantDefinition"), "$", $.right($.str("="), $.field($.ref(() => expression$noSkip), "expression", $.right(semicolon$noSkip, $.eps)))));
export const ConstantDeclaration: $.Parser<$$.ConstantDeclaration> = $.loc($.field($.pure("ConstantDeclaration"), "$", $.right($.stry(semicolon), $.eps)));
export const ConstantDeclaration$noSkip: $.Parser<$$.ConstantDeclaration$noSkip> = $.loc($.field($.pure("ConstantDeclaration"), "$", $.right($.stry(semicolon$noSkip), $.eps)));
export const inter = <A, B>(A: $.Parser<A>, B: $.Parser<B>): $.Parser<$$.inter<A, B>> => $.field($.ref(() => A), "head", $.field($.star($.field($.ref(() => B), "op", $.field($.ref(() => A), "right", $.eps))), "tail", $.eps));
export const structFields: $.Parser<$$.structFields> = $.left($.opt(inter(FieldDecl, $.left($.str(";"), $.star(space$noSkip)))), $.opt($.left($.str(";"), $.star(space$noSkip))));
export const inter$noSkip = <A, B>(A: $.Parser<A>, B: $.Parser<B>): $.Parser<$$.inter$noSkip<A, B>> => $.field($.ref(() => A), "head", $.field($.star($.field($.ref(() => B), "op", $.field($.ref(() => A), "right", $.eps))), "tail", $.eps));
export const structFields$noSkip: $.Parser<$$.structFields$noSkip> = $.left($.opt(inter$noSkip(FieldDecl$noSkip, $.str(";"))), $.opt($.str(";")));
export const inheritedTraits: $.Parser<$$.inheritedTraits> = $.left(inter(Id, $.left($.str(","), $.star(space$noSkip))), $.opt($.left($.str(","), $.star(space$noSkip))));
export const inheritedTraits$noSkip: $.Parser<$$.inheritedTraits$noSkip> = $.left(inter$noSkip(Id$noSkip, $.str(",")), $.opt($.str(",")));
export const ContractAttribute: $.Parser<$$.ContractAttribute> = $.loc($.field($.pure("ContractAttribute"), "$", $.right($.left($.str("@interface"), $.star(space$noSkip)), $.right($.left($.str("("), $.star(space$noSkip)), $.field($.ref(() => StringLiteral), "name", $.right($.left($.str(")"), $.star(space$noSkip)), $.eps))))));
export const ContractAttribute$noSkip: $.Parser<$$.ContractAttribute$noSkip> = $.loc($.field($.pure("ContractAttribute"), "$", $.right($.str("@interface"), $.right($.str("("), $.field($.ref(() => StringLiteral$noSkip), "name", $.right($.str(")"), $.eps))))));
export const FunctionAttribute: $.Parser<$$.FunctionAttribute> = $.loc($.field($.pure("FunctionAttribute"), "$", $.field($.alt($.ref(() => GetAttribute), $.alt($.ref(() => mutates), $.alt($.ref(() => $extends), $.alt($.ref(() => virtual), $.alt($.ref(() => override), $.alt($.ref(() => inline), $.ref(() => $abstract))))))), "name", $.eps)));
export const FunctionAttribute$noSkip: $.Parser<$$.FunctionAttribute$noSkip> = $.loc($.field($.pure("FunctionAttribute"), "$", $.field($.alt($.ref(() => GetAttribute$noSkip), $.alt($.ref(() => mutates$noSkip), $.alt($.ref(() => $extends$noSkip), $.alt($.ref(() => virtual$noSkip), $.alt($.ref(() => override$noSkip), $.alt($.ref(() => inline$noSkip), $.ref(() => $abstract$noSkip))))))), "name", $.eps)));
export const GetAttribute: $.Parser<$$.GetAttribute> = $.loc($.field($.pure("GetAttribute"), "$", $.right($.left($.str("get"), $.star(space$noSkip)), $.field($.opt($.right($.left($.str("("), $.star(space$noSkip)), $.left($.ref(() => expression), $.left($.str(")"), $.star(space$noSkip))))), "methodId", $.eps))));
export const GetAttribute$noSkip: $.Parser<$$.GetAttribute$noSkip> = $.loc($.field($.pure("GetAttribute"), "$", $.right($.str("get"), $.field($.opt($.right($.str("("), $.left($.ref(() => expression$noSkip), $.str(")")))), "methodId", $.eps))));
export const idPart$noSkip: $.Parser<$$.idPart$noSkip> = $.regex<string | string | "_">("a-z0-9_", true);
export const receive: $.Parser<$$.receive> = $.left($.left($.str("receive"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const external: $.Parser<$$.external> = $.left($.left($.str("external"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const receiverType: $.Parser<$$.receiverType> = $.alt($.left($.str("bounced"), $.star(space$noSkip)), $.alt(receive, external));
export const receive$noSkip: $.Parser<$$.receive$noSkip> = $.left($.str("receive"), $.lookNeg(idPart$noSkip));
export const external$noSkip: $.Parser<$$.external$noSkip> = $.left($.str("external"), $.lookNeg(idPart$noSkip));
export const receiverType$noSkip: $.Parser<$$.receiverType$noSkip> = $.alt($.str("bounced"), $.alt(receive$noSkip, external$noSkip));
export const Parameter: $.Parser<$$.Parameter> = $.loc($.field($.pure("Parameter"), "$", $.field(Id, "name", $.field($.ref(() => ascription), "type", $.eps))));
export const StringLiteral: $.Parser<$$.StringLiteral> = $.loc($.field($.pure("StringLiteral"), "$", $.right($.left($.str("\""), $.star(space$noSkip)), $.field($.left($.stry($.star($.alt($.regex<"\"" | "\\">("^\"\\\\", false), $.right($.str("\\"), $.ref(() => escapeChar$noSkip))))), $.star(space$noSkip)), "value", $.right($.left($.str("\""), $.star(space$noSkip)), $.eps)))));
export const receiverParam: $.Parser<$$.receiverParam> = $.opt($.alt(Parameter, StringLiteral));
export const Parameter$noSkip: $.Parser<$$.Parameter$noSkip> = $.loc($.field($.pure("Parameter"), "$", $.field(Id$noSkip, "name", $.field($.ref(() => ascription$noSkip), "type", $.eps))));
export const StringLiteral$noSkip: $.Parser<$$.StringLiteral$noSkip> = $.loc($.field($.pure("StringLiteral"), "$", $.right($.str("\""), $.field($.stry($.star($.alt($.regex<"\"" | "\\">("^\"\\\\", false), $.right($.str("\\"), $.ref(() => escapeChar$noSkip))))), "value", $.right($.str("\""), $.eps)))));
export const receiverParam$noSkip: $.Parser<$$.receiverParam$noSkip> = $.opt($.alt(Parameter$noSkip, StringLiteral$noSkip));
export const hexDigit: $.Parser<$$.hexDigit> = $.left($.regex<string | string>("0-9a-f", true), $.star(space$noSkip));
export const asmData: $.Parser<$$.asmData> = $.right($.left($.regex<"x" | "b">("xb", true), $.star(space$noSkip)), $.right($.left($.str("{"), $.star(space$noSkip)), $.right($.star(hexDigit), $.right($.left($.str("}"), $.star(space$noSkip)), $.eps))));
export const multiLineComment: $.Parser<$$.multiLineComment> = $.right($.left($.str("/*"), $.star(space$noSkip)), $.left($.stry($.star($.right($.lookNeg($.left($.str("*/"), $.star(space$noSkip))), $.right($.left($.any, $.star(space$noSkip)), $.eps)))), $.left($.str("*/"), $.star(space$noSkip))));
export const singleLineComment: $.Parser<$$.singleLineComment> = $.right($.left($.str("//"), $.star(space$noSkip)), $.stry($.star($.left($.regex<"\r" | "\n">("^\\r\\n", false), $.star(space$noSkip)))));
export const comment: $.Parser<$$.comment> = $.alt(multiLineComment, singleLineComment);
export const space: $.Parser<$$.space> = $.alt($.left($.regex<" " | "\t" | "\r" | "\n">(" \\t\\r\\n", false), $.star(space$noSkip)), comment);
export const asmAny: $.Parser<$$.asmAny> = $.right($.lookNeg(comment), $.right($.plus($.right($.lookNeg(space), $.right($.lookNeg($.left($.str("}"), $.star(space$noSkip))), $.right($.left($.any, $.star(space$noSkip)), $.eps)))), $.eps));
export const asmInstruction: $.Parser<$$.asmInstruction> = $.stry($.alt(asmData, asmAny));
export const hexDigit$noSkip: $.Parser<$$.hexDigit$noSkip> = $.regex<string | string>("0-9a-f", true);
export const asmData$noSkip: $.Parser<$$.asmData$noSkip> = $.right($.regex<"x" | "b">("xb", true), $.right($.str("{"), $.right($.star(hexDigit$noSkip), $.right($.str("}"), $.eps))));
export const asmAny$noSkip: $.Parser<$$.asmAny$noSkip> = $.right($.lookNeg(comment$noSkip), $.right($.plus($.right($.lookNeg(space$noSkip), $.right($.lookNeg($.str("}")), $.right($.any, $.eps)))), $.eps));
export const asmInstruction$noSkip: $.Parser<$$.asmInstruction$noSkip> = $.stry($.alt(asmData$noSkip, asmAny$noSkip));
export const TypeOptional: $.Parser<$$.TypeOptional> = $.loc($.field($.pure("TypeOptional"), "$", $.field($.ref(() => TypeId), "child", $.right($.left($.str("?"), $.star(space$noSkip)), $.eps))));
export const TypeRegular: $.Parser<$$.TypeRegular> = $.loc($.field($.pure("TypeRegular"), "$", $.field($.ref(() => TypeId), "child", $.eps)));
export const TypeMap: $.Parser<$$.TypeMap> = $.loc($.field($.pure("TypeMap"), "$", $.right($.ref(() => map), $.right($.left($.str("<"), $.star(space$noSkip)), $.field($.ref(() => TypeId), "key", $.field($.opt($.right($.ref(() => $as), Id)), "keyAs", $.right($.left($.str(","), $.star(space$noSkip)), $.field($.ref(() => TypeId), "value", $.field($.opt($.right($.ref(() => $as), Id)), "valueAs", $.right($.left($.str(">"), $.star(space$noSkip)), $.eps))))))))));
export const TypeBounced: $.Parser<$$.TypeBounced> = $.loc($.field($.pure("TypeBounced"), "$", $.right($.left($.str("bounced"), $.star(space$noSkip)), $.right($.left($.str("<"), $.star(space$noSkip)), $.field($.ref(() => TypeId), "child", $.right($.left($.str(">"), $.star(space$noSkip)), $.eps))))));
export const $type: $.Parser<$$.$type> = $.alt(TypeOptional, $.alt(TypeRegular, $.alt(TypeMap, TypeBounced)));
export const ascription: $.Parser<$$.ascription> = $.right($.left($.str(":"), $.star(space$noSkip)), $type);
export const TypeOptional$noSkip: $.Parser<$$.TypeOptional$noSkip> = $.loc($.field($.pure("TypeOptional"), "$", $.field($.ref(() => TypeId$noSkip), "child", $.right($.str("?"), $.eps))));
export const TypeRegular$noSkip: $.Parser<$$.TypeRegular$noSkip> = $.loc($.field($.pure("TypeRegular"), "$", $.field($.ref(() => TypeId$noSkip), "child", $.eps)));
export const TypeMap$noSkip: $.Parser<$$.TypeMap$noSkip> = $.loc($.field($.pure("TypeMap"), "$", $.right($.ref(() => map$noSkip), $.right($.str("<"), $.field($.ref(() => TypeId$noSkip), "key", $.field($.opt($.right($.ref(() => $as$noSkip), Id$noSkip)), "keyAs", $.right($.str(","), $.field($.ref(() => TypeId$noSkip), "value", $.field($.opt($.right($.ref(() => $as$noSkip), Id$noSkip)), "valueAs", $.right($.str(">"), $.eps))))))))));
export const TypeBounced$noSkip: $.Parser<$$.TypeBounced$noSkip> = $.loc($.field($.pure("TypeBounced"), "$", $.right($.str("bounced"), $.right($.str("<"), $.field($.ref(() => TypeId$noSkip), "child", $.right($.str(">"), $.eps))))));
export const $type$noSkip: $.Parser<$$.$type$noSkip> = $.alt(TypeOptional$noSkip, $.alt(TypeRegular$noSkip, $.alt(TypeMap$noSkip, TypeBounced$noSkip)));
export const ascription$noSkip: $.Parser<$$.ascription$noSkip> = $.right($.str(":"), $type$noSkip);
export const TypeId: $.Parser<$$.TypeId> = $.loc($.field($.pure("TypeId"), "$", $.field($.left($.stry($.right($.regex<string>("A-Z", false), $.right($.star($.regex<string | string | "_">("a-z0-9_", true)), $.eps))), $.star(space$noSkip)), "name", $.eps)));
export const TypeId$noSkip: $.Parser<$$.TypeId$noSkip> = $.loc($.field($.pure("TypeId"), "$", $.field($.stry($.right($.regex<string>("A-Z", false), $.right($.star($.regex<string | string | "_">("a-z0-9_", true)), $.eps))), "name", $.eps)));
export const StatementLet: $.Parser<$$.StatementLet> = $.loc($.field($.pure("StatementLet"), "$", $.right($.ref(() => $let), $.field(Id, "name", $.field($.opt(ascription), "type", $.right($.left($.str("="), $.star(space$noSkip)), $.field($.ref(() => expression), "init", $.right(semicolon, $.eps))))))));
export const StatementBlock: $.Parser<$$.StatementBlock> = $.loc($.field($.pure("StatementBlock"), "$", $.field($.ref(() => statements), "body", $.eps)));
export const StatementReturn: $.Parser<$$.StatementReturn> = $.loc($.field($.pure("StatementReturn"), "$", $.right($.ref(() => $return), $.field($.opt($.ref(() => expression)), "expression", $.right(semicolon, $.eps)))));
export const StatementCondition: $.Parser<$$.StatementCondition> = $.loc($.field($.pure("StatementCondition"), "$", $.right($.ref(() => $if), $.field($.ref(() => expression), "condition", $.field($.ref(() => statements), "trueBranch", $.field($.opt($.right($.ref(() => $else), $.alt($.ref(() => FalseBranch), $.ref(() => StatementCondition)))), "falseBranch", $.eps))))));
export const StatementWhile: $.Parser<$$.StatementWhile> = $.loc($.field($.pure("StatementWhile"), "$", $.right($.ref(() => $while), $.field($.ref(() => parens), "condition", $.field($.ref(() => statements), "body", $.eps)))));
export const StatementRepeat: $.Parser<$$.StatementRepeat> = $.loc($.field($.pure("StatementRepeat"), "$", $.right($.ref(() => repeat), $.field($.ref(() => parens), "condition", $.field($.ref(() => statements), "body", $.eps)))));
export const StatementUntil: $.Parser<$$.StatementUntil> = $.loc($.field($.pure("StatementUntil"), "$", $.right($.ref(() => $do), $.field($.ref(() => statements), "body", $.right($.ref(() => until), $.field($.ref(() => parens), "condition", $.right(semicolon, $.eps)))))));
export const StatementTry: $.Parser<$$.StatementTry> = $.loc($.field($.pure("StatementTry"), "$", $.right($.ref(() => $try), $.field($.ref(() => statements), "body", $.field($.opt($.right($.ref(() => $catch), $.right($.left($.str("("), $.star(space$noSkip)), $.field(Id, "name", $.right($.left($.str(")"), $.star(space$noSkip)), $.field($.ref(() => statements), "body", $.eps)))))), "handler", $.eps)))));
export const StatementForEach: $.Parser<$$.StatementForEach> = $.loc($.field($.pure("StatementForEach"), "$", $.right($.ref(() => foreach), $.right($.left($.str("("), $.star(space$noSkip)), $.field(Id, "key", $.right($.left($.str(","), $.star(space$noSkip)), $.field(Id, "value", $.right($.left($.str("in"), $.star(space$noSkip)), $.field($.ref(() => expression), "expression", $.right($.left($.str(")"), $.star(space$noSkip)), $.field($.ref(() => statements), "body", $.eps)))))))))));
export const StatementExpression: $.Parser<$$.StatementExpression> = $.loc($.field($.pure("StatementExpression"), "$", $.field($.ref(() => expression), "expression", $.right(semicolon, $.eps))));
export const StatementAssign: $.Parser<$$.StatementAssign> = $.loc($.field($.pure("StatementAssign"), "$", $.field($.ref(() => expression), "left", $.field($.opt($.left($.regex<"-" | "+" | "*" | "/" | "%" | "|" | "&" | "^">("-+*/%|&^", false), $.star(space$noSkip))), "operator", $.right($.left($.str("="), $.star(space$noSkip)), $.field($.ref(() => expression), "right", $.right(semicolon, $.eps)))))));
export const statement: $.Parser<$$.statement> = $.alt(StatementLet, $.alt(StatementBlock, $.alt(StatementReturn, $.alt(StatementCondition, $.alt(StatementWhile, $.alt(StatementRepeat, $.alt(StatementUntil, $.alt(StatementTry, $.alt(StatementForEach, $.alt(StatementExpression, StatementAssign))))))))));
export const StatementLet$noSkip: $.Parser<$$.StatementLet$noSkip> = $.loc($.field($.pure("StatementLet"), "$", $.right($.ref(() => $let$noSkip), $.field(Id$noSkip, "name", $.field($.opt(ascription$noSkip), "type", $.right($.str("="), $.field($.ref(() => expression$noSkip), "init", $.right(semicolon$noSkip, $.eps))))))));
export const StatementBlock$noSkip: $.Parser<$$.StatementBlock$noSkip> = $.loc($.field($.pure("StatementBlock"), "$", $.field($.ref(() => statements$noSkip), "body", $.eps)));
export const StatementReturn$noSkip: $.Parser<$$.StatementReturn$noSkip> = $.loc($.field($.pure("StatementReturn"), "$", $.right($.ref(() => $return$noSkip), $.field($.opt($.ref(() => expression$noSkip)), "expression", $.right(semicolon$noSkip, $.eps)))));
export const StatementCondition$noSkip: $.Parser<$$.StatementCondition$noSkip> = $.loc($.field($.pure("StatementCondition"), "$", $.right($.ref(() => $if$noSkip), $.field($.ref(() => expression$noSkip), "condition", $.field($.ref(() => statements$noSkip), "trueBranch", $.field($.opt($.right($.ref(() => $else$noSkip), $.alt($.ref(() => FalseBranch$noSkip), $.ref(() => StatementCondition$noSkip)))), "falseBranch", $.eps))))));
export const StatementWhile$noSkip: $.Parser<$$.StatementWhile$noSkip> = $.loc($.field($.pure("StatementWhile"), "$", $.right($.ref(() => $while$noSkip), $.field($.ref(() => parens$noSkip), "condition", $.field($.ref(() => statements$noSkip), "body", $.eps)))));
export const StatementRepeat$noSkip: $.Parser<$$.StatementRepeat$noSkip> = $.loc($.field($.pure("StatementRepeat"), "$", $.right($.ref(() => repeat$noSkip), $.field($.ref(() => parens$noSkip), "condition", $.field($.ref(() => statements$noSkip), "body", $.eps)))));
export const StatementUntil$noSkip: $.Parser<$$.StatementUntil$noSkip> = $.loc($.field($.pure("StatementUntil"), "$", $.right($.ref(() => $do$noSkip), $.field($.ref(() => statements$noSkip), "body", $.right($.ref(() => until$noSkip), $.field($.ref(() => parens$noSkip), "condition", $.right(semicolon$noSkip, $.eps)))))));
export const StatementTry$noSkip: $.Parser<$$.StatementTry$noSkip> = $.loc($.field($.pure("StatementTry"), "$", $.right($.ref(() => $try$noSkip), $.field($.ref(() => statements$noSkip), "body", $.field($.opt($.right($.ref(() => $catch$noSkip), $.right($.str("("), $.field(Id$noSkip, "name", $.right($.str(")"), $.field($.ref(() => statements$noSkip), "body", $.eps)))))), "handler", $.eps)))));
export const StatementForEach$noSkip: $.Parser<$$.StatementForEach$noSkip> = $.loc($.field($.pure("StatementForEach"), "$", $.right($.ref(() => foreach$noSkip), $.right($.str("("), $.field(Id$noSkip, "key", $.right($.str(","), $.field(Id$noSkip, "value", $.right($.str("in"), $.field($.ref(() => expression$noSkip), "expression", $.right($.str(")"), $.field($.ref(() => statements$noSkip), "body", $.eps)))))))))));
export const StatementExpression$noSkip: $.Parser<$$.StatementExpression$noSkip> = $.loc($.field($.pure("StatementExpression"), "$", $.field($.ref(() => expression$noSkip), "expression", $.right(semicolon$noSkip, $.eps))));
export const StatementAssign$noSkip: $.Parser<$$.StatementAssign$noSkip> = $.loc($.field($.pure("StatementAssign"), "$", $.field($.ref(() => expression$noSkip), "left", $.field($.opt($.regex<"-" | "+" | "*" | "/" | "%" | "|" | "&" | "^">("-+*/%|&^", false)), "operator", $.right($.str("="), $.field($.ref(() => expression$noSkip), "right", $.right(semicolon$noSkip, $.eps)))))));
export const statement$noSkip: $.Parser<$$.statement$noSkip> = $.alt(StatementLet$noSkip, $.alt(StatementBlock$noSkip, $.alt(StatementReturn$noSkip, $.alt(StatementCondition$noSkip, $.alt(StatementWhile$noSkip, $.alt(StatementRepeat$noSkip, $.alt(StatementUntil$noSkip, $.alt(StatementTry$noSkip, $.alt(StatementForEach$noSkip, $.alt(StatementExpression$noSkip, StatementAssign$noSkip))))))))));
export const statements: $.Parser<$$.statements> = $.right($.left($.str("{"), $.star(space$noSkip)), $.left($.star(statement), $.left($.str("}"), $.star(space$noSkip))));
export const statements$noSkip: $.Parser<$$.statements$noSkip> = $.right($.str("{"), $.left($.star(statement$noSkip), $.str("}")));
export const FalseBranch: $.Parser<$$.FalseBranch> = $.loc($.field($.pure("FalseBranch"), "$", $.field(statements, "body", $.eps)));
export const FalseBranch$noSkip: $.Parser<$$.FalseBranch$noSkip> = $.loc($.field($.pure("FalseBranch"), "$", $.field(statements$noSkip, "body", $.eps)));
export const Conditional: $.Parser<$$.Conditional> = $.loc($.field($.pure("Conditional"), "$", $.field($.ref(() => or), "head", $.field($.opt($.right($.left($.str("?"), $.star(space$noSkip)), $.field($.ref(() => or), "thenBranch", $.right($.left($.str(":"), $.star(space$noSkip)), $.field($.ref(() => Conditional), "elseBranch", $.eps))))), "tail", $.eps))));
export const expression: $.Parser<$$.expression> = Conditional;
export const Conditional$noSkip: $.Parser<$$.Conditional$noSkip> = $.loc($.field($.pure("Conditional"), "$", $.field($.ref(() => or$noSkip), "head", $.field($.opt($.right($.str("?"), $.field($.ref(() => or$noSkip), "thenBranch", $.right($.str(":"), $.field($.ref(() => Conditional$noSkip), "elseBranch", $.eps))))), "tail", $.eps))));
export const expression$noSkip: $.Parser<$$.expression$noSkip> = Conditional$noSkip;
export const Binary = <T, U>(T: $.Parser<T>, U: $.Parser<U>): $.Parser<$$.Binary<T, U>> => $.loc($.field($.pure("Binary"), "$", $.field(inter($.ref(() => T), $.ref(() => Operator($.ref(() => U)))), "exprs", $.eps)));
export const Unary: $.Parser<$$.Unary> = $.loc($.field($.pure("Unary"), "$", $.field($.star($.ref(() => Operator($.left($.regex<"-" | "+" | "!" | "~">("-+!~", false), $.star(space$noSkip))))), "prefixes", $.field($.ref(() => Suffix), "expression", $.eps))));
export const mul: $.Parser<$$.mul> = Binary(Unary, $.left($.regex<"*" | "/" | "%">("*/%", false), $.star(space$noSkip)));
export const add: $.Parser<$$.add> = Binary(mul, $.alt($.left($.left($.str("+"), $.star(space$noSkip)), $.lookNeg($.left($.str("+"), $.star(space$noSkip)))), $.left($.left($.str("-"), $.star(space$noSkip)), $.lookNeg($.left($.str("-"), $.star(space$noSkip))))));
export const bitwiseShift: $.Parser<$$.bitwiseShift> = Binary(add, $.alt($.left($.str("<<"), $.star(space$noSkip)), $.left($.str(">>"), $.star(space$noSkip))));
export const compare: $.Parser<$$.compare> = Binary(bitwiseShift, $.alt($.left($.str("<="), $.star(space$noSkip)), $.alt($.left($.str("<"), $.star(space$noSkip)), $.alt($.left($.str(">="), $.star(space$noSkip)), $.left($.str(">"), $.star(space$noSkip))))));
export const equality: $.Parser<$$.equality> = Binary(compare, $.alt($.left($.str("!="), $.star(space$noSkip)), $.left($.str("=="), $.star(space$noSkip))));
export const bitwiseAnd: $.Parser<$$.bitwiseAnd> = Binary(equality, $.left($.str("&"), $.star(space$noSkip)));
export const bitwiseXor: $.Parser<$$.bitwiseXor> = Binary(bitwiseAnd, $.left($.str("^"), $.star(space$noSkip)));
export const bitwiseOr: $.Parser<$$.bitwiseOr> = Binary(bitwiseXor, $.left($.str("|"), $.star(space$noSkip)));
export const and: $.Parser<$$.and> = Binary(bitwiseOr, $.left($.str("&&"), $.star(space$noSkip)));
export const or: $.Parser<$$.or> = Binary(and, $.left($.str("||"), $.star(space$noSkip)));
export const Binary$noSkip = <T, U>(T: $.Parser<T>, U: $.Parser<U>): $.Parser<$$.Binary$noSkip<T, U>> => $.loc($.field($.pure("Binary"), "$", $.field(inter$noSkip($.ref(() => T), $.ref(() => Operator$noSkip($.ref(() => U)))), "exprs", $.eps)));
export const Unary$noSkip: $.Parser<$$.Unary$noSkip> = $.loc($.field($.pure("Unary"), "$", $.field($.star($.ref(() => Operator$noSkip($.regex<"-" | "+" | "!" | "~">("-+!~", false)))), "prefixes", $.field($.ref(() => Suffix$noSkip), "expression", $.eps))));
export const mul$noSkip: $.Parser<$$.mul$noSkip> = Binary$noSkip(Unary$noSkip, $.regex<"*" | "/" | "%">("*/%", false));
export const add$noSkip: $.Parser<$$.add$noSkip> = Binary$noSkip(mul$noSkip, $.alt($.left($.str("+"), $.lookNeg($.str("+"))), $.left($.str("-"), $.lookNeg($.str("-")))));
export const bitwiseShift$noSkip: $.Parser<$$.bitwiseShift$noSkip> = Binary$noSkip(add$noSkip, $.alt($.str("<<"), $.str(">>")));
export const compare$noSkip: $.Parser<$$.compare$noSkip> = Binary$noSkip(bitwiseShift$noSkip, $.alt($.str("<="), $.alt($.str("<"), $.alt($.str(">="), $.str(">")))));
export const equality$noSkip: $.Parser<$$.equality$noSkip> = Binary$noSkip(compare$noSkip, $.alt($.str("!="), $.str("==")));
export const bitwiseAnd$noSkip: $.Parser<$$.bitwiseAnd$noSkip> = Binary$noSkip(equality$noSkip, $.str("&"));
export const bitwiseXor$noSkip: $.Parser<$$.bitwiseXor$noSkip> = Binary$noSkip(bitwiseAnd$noSkip, $.str("^"));
export const bitwiseOr$noSkip: $.Parser<$$.bitwiseOr$noSkip> = Binary$noSkip(bitwiseXor$noSkip, $.str("|"));
export const and$noSkip: $.Parser<$$.and$noSkip> = Binary$noSkip(bitwiseOr$noSkip, $.str("&&"));
export const or$noSkip: $.Parser<$$.or$noSkip> = Binary$noSkip(and$noSkip, $.str("||"));
export const Suffix: $.Parser<$$.Suffix> = $.loc($.field($.pure("Suffix"), "$", $.field($.ref(() => primary), "expression", $.field($.star($.ref(() => suffix)), "suffixes", $.eps))));
export const Suffix$noSkip: $.Parser<$$.Suffix$noSkip> = $.loc($.field($.pure("Suffix"), "$", $.field($.ref(() => primary$noSkip), "expression", $.field($.star($.ref(() => suffix$noSkip)), "suffixes", $.eps))));
export const Operator = <U,>(U: $.Parser<U>): $.Parser<$$.Operator<U>> => $.loc($.field($.pure("Operator"), "$", $.field($.ref(() => U), "name", $.eps)));
export const Operator$noSkip = <U,>(U: $.Parser<U>): $.Parser<$$.Operator$noSkip<U>> => $.loc($.field($.pure("Operator"), "$", $.field($.ref(() => U), "name", $.eps)));
export const SuffixUnboxNotNull: $.Parser<$$.SuffixUnboxNotNull> = $.loc($.field($.pure("SuffixUnboxNotNull"), "$", $.right($.left($.str("!!"), $.star(space$noSkip)), $.eps)));
export const SuffixCall: $.Parser<$$.SuffixCall> = $.loc($.field($.pure("SuffixCall"), "$", $.field($.ref(() => parametersPassed), "params", $.eps)));
export const SuffixFieldAccess: $.Parser<$$.SuffixFieldAccess> = $.loc($.field($.pure("SuffixFieldAccess"), "$", $.right($.left($.str("."), $.star(space$noSkip)), $.field(Id, "name", $.eps))));
export const suffix: $.Parser<$$.suffix> = $.alt(SuffixUnboxNotNull, $.alt(SuffixCall, SuffixFieldAccess));
export const SuffixUnboxNotNull$noSkip: $.Parser<$$.SuffixUnboxNotNull$noSkip> = $.loc($.field($.pure("SuffixUnboxNotNull"), "$", $.right($.str("!!"), $.eps)));
export const SuffixCall$noSkip: $.Parser<$$.SuffixCall$noSkip> = $.loc($.field($.pure("SuffixCall"), "$", $.field($.ref(() => parametersPassed$noSkip), "params", $.eps)));
export const SuffixFieldAccess$noSkip: $.Parser<$$.SuffixFieldAccess$noSkip> = $.loc($.field($.pure("SuffixFieldAccess"), "$", $.right($.str("."), $.field(Id$noSkip, "name", $.eps))));
export const suffix$noSkip: $.Parser<$$.suffix$noSkip> = $.alt(SuffixUnboxNotNull$noSkip, $.alt(SuffixCall$noSkip, SuffixFieldAccess$noSkip));
export const Parens: $.Parser<$$.Parens> = $.loc($.field($.pure("Parens"), "$", $.field($.ref(() => parens), "child", $.eps)));
export const StructInstance: $.Parser<$$.StructInstance> = $.loc($.field($.pure("StructInstance"), "$", $.field(TypeId, "type", $.right($.left($.str("{"), $.star(space$noSkip)), $.field($.opt(inter($.ref(() => StructFieldInitializer), $.left($.str(","), $.star(space$noSkip)))), "fields", $.right($.opt($.left($.str(","), $.star(space$noSkip))), $.right($.left($.str("}"), $.star(space$noSkip)), $.eps)))))));
export const IntegerLiteral: $.Parser<$$.IntegerLiteral> = $.loc($.field($.pure("IntegerLiteral"), "$", $.field($.alt($.ref(() => IntegerLiteralHex), $.alt($.ref(() => IntegerLiteralBin), $.alt($.ref(() => IntegerLiteralOct), IntegerLiteralDec))), "value", $.eps)));
export const BoolLiteral: $.Parser<$$.BoolLiteral> = $.loc($.field($.pure("BoolLiteral"), "$", $.field($.alt($.left($.str("true"), $.star(space$noSkip)), $.left($.str("false"), $.star(space$noSkip))), "value", $.right($.lookNeg($.ref(() => idPart)), $.eps))));
export const InitOf: $.Parser<$$.InitOf> = $.loc($.field($.pure("InitOf"), "$", $.right($.ref(() => initOf), $.field(Id, "name", $.field($.ref(() => parametersPassed), "params", $.eps)))));
export const Null: $.Parser<$$.Null> = $.loc($.field($.pure("Null"), "$", $.right($.ref(() => $null), $.eps)));
export const primary: $.Parser<$$.primary> = $.alt(Parens, $.alt(StructInstance, $.alt(IntegerLiteral, $.alt(BoolLiteral, $.alt(InitOf, $.alt(Null, $.alt(StringLiteral, Id)))))));
export const Parens$noSkip: $.Parser<$$.Parens$noSkip> = $.loc($.field($.pure("Parens"), "$", $.field($.ref(() => parens$noSkip), "child", $.eps)));
export const StructInstance$noSkip: $.Parser<$$.StructInstance$noSkip> = $.loc($.field($.pure("StructInstance"), "$", $.field(TypeId$noSkip, "type", $.right($.str("{"), $.field($.opt(inter$noSkip($.ref(() => StructFieldInitializer$noSkip), $.str(","))), "fields", $.right($.opt($.str(",")), $.right($.str("}"), $.eps)))))));
export const IntegerLiteral$noSkip: $.Parser<$$.IntegerLiteral$noSkip> = $.loc($.field($.pure("IntegerLiteral"), "$", $.field($.alt($.ref(() => IntegerLiteralHex$noSkip), $.alt($.ref(() => IntegerLiteralBin$noSkip), $.alt($.ref(() => IntegerLiteralOct$noSkip), IntegerLiteralDec$noSkip))), "value", $.eps)));
export const BoolLiteral$noSkip: $.Parser<$$.BoolLiteral$noSkip> = $.loc($.field($.pure("BoolLiteral"), "$", $.field($.alt($.str("true"), $.str("false")), "value", $.right($.lookNeg(idPart$noSkip), $.eps))));
export const InitOf$noSkip: $.Parser<$$.InitOf$noSkip> = $.loc($.field($.pure("InitOf"), "$", $.right($.ref(() => initOf$noSkip), $.field(Id$noSkip, "name", $.field($.ref(() => parametersPassed$noSkip), "params", $.eps)))));
export const Null$noSkip: $.Parser<$$.Null$noSkip> = $.loc($.field($.pure("Null"), "$", $.right($.ref(() => $null$noSkip), $.eps)));
export const primary$noSkip: $.Parser<$$.primary$noSkip> = $.alt(Parens$noSkip, $.alt(StructInstance$noSkip, $.alt(IntegerLiteral$noSkip, $.alt(BoolLiteral$noSkip, $.alt(InitOf$noSkip, $.alt(Null$noSkip, $.alt(StringLiteral$noSkip, Id$noSkip)))))));
export const parens: $.Parser<$$.parens> = $.right($.left($.str("("), $.star(space$noSkip)), $.left(expression, $.left($.str(")"), $.star(space$noSkip))));
export const parens$noSkip: $.Parser<$$.parens$noSkip> = $.right($.str("("), $.left(expression$noSkip, $.str(")")));
export const StructFieldInitializer: $.Parser<$$.StructFieldInitializer> = $.loc($.field($.pure("StructFieldInitializer"), "$", $.field(Id, "name", $.field($.opt($.right($.left($.str(":"), $.star(space$noSkip)), expression)), "init", $.eps))));
export const StructFieldInitializer$noSkip: $.Parser<$$.StructFieldInitializer$noSkip> = $.loc($.field($.pure("StructFieldInitializer"), "$", $.field(Id$noSkip, "name", $.field($.opt($.right($.str(":"), expression$noSkip)), "init", $.eps))));
export const parametersPassed: $.Parser<$$.parametersPassed> = $.right($.left($.str("("), $.star(space$noSkip)), $.left($.opt($.left(inter(expression, $.left($.str(","), $.star(space$noSkip))), $.opt($.left($.str(","), $.star(space$noSkip))))), $.left($.str(")"), $.star(space$noSkip))));
export const parametersPassed$noSkip: $.Parser<$$.parametersPassed$noSkip> = $.right($.str("("), $.left($.opt($.left(inter$noSkip(expression$noSkip, $.str(",")), $.opt($.str(",")))), $.str(")")));
export const parametersFormal: $.Parser<$$.parametersFormal> = $.right($.left($.str("("), $.star(space$noSkip)), $.left($.opt($.left(inter(Parameter, $.left($.str(","), $.star(space$noSkip))), $.opt($.left($.str(","), $.star(space$noSkip))))), $.left($.str(")"), $.star(space$noSkip))));
export const parametersFormal$noSkip: $.Parser<$$.parametersFormal$noSkip> = $.right($.str("("), $.left($.opt($.left(inter$noSkip(Parameter$noSkip, $.str(",")), $.opt($.str(",")))), $.str(")")));
export const IntegerLiteralHex: $.Parser<$$.IntegerLiteralHex> = $.loc($.field($.pure("IntegerLiteralHex"), "$", $.right($.left($.str("0"), $.star(space$noSkip)), $.right($.left($.regex<"x">("x", true), $.star(space$noSkip)), $.field($.stry($.right(hexDigit, $.right($.star($.right($.opt($.left($.str("_"), $.star(space$noSkip))), $.right(hexDigit, $.eps))), $.eps))), "digits", $.eps)))));
export const IntegerLiteralHex$noSkip: $.Parser<$$.IntegerLiteralHex$noSkip> = $.loc($.field($.pure("IntegerLiteralHex"), "$", $.right($.str("0"), $.right($.regex<"x">("x", true), $.field($.stry($.right(hexDigit$noSkip, $.right($.star($.right($.opt($.str("_")), $.right(hexDigit$noSkip, $.eps))), $.eps))), "digits", $.eps)))));
export const IntegerLiteralBin: $.Parser<$$.IntegerLiteralBin> = $.loc($.field($.pure("IntegerLiteralBin"), "$", $.right($.left($.str("0"), $.star(space$noSkip)), $.right($.left($.regex<"b">("b", true), $.star(space$noSkip)), $.field($.stry($.right($.left($.regex<"0" | "1">("01", false), $.star(space$noSkip)), $.right($.star($.right($.opt($.left($.str("_"), $.star(space$noSkip))), $.right($.left($.regex<"0" | "1">("01", false), $.star(space$noSkip)), $.eps))), $.eps))), "digits", $.eps)))));
export const IntegerLiteralBin$noSkip: $.Parser<$$.IntegerLiteralBin$noSkip> = $.loc($.field($.pure("IntegerLiteralBin"), "$", $.right($.str("0"), $.right($.regex<"b">("b", true), $.field($.stry($.right($.regex<"0" | "1">("01", false), $.right($.star($.right($.opt($.str("_")), $.right($.regex<"0" | "1">("01", false), $.eps))), $.eps))), "digits", $.eps)))));
export const IntegerLiteralOct: $.Parser<$$.IntegerLiteralOct> = $.loc($.field($.pure("IntegerLiteralOct"), "$", $.right($.left($.str("0"), $.star(space$noSkip)), $.right($.left($.regex<"o">("o", true), $.star(space$noSkip)), $.field($.stry($.right($.left($.regex<string>("0-7", false), $.star(space$noSkip)), $.right($.star($.right($.opt($.left($.str("_"), $.star(space$noSkip))), $.right($.left($.regex<string>("0-7", false), $.star(space$noSkip)), $.eps))), $.eps))), "digits", $.eps)))));
export const IntegerLiteralOct$noSkip: $.Parser<$$.IntegerLiteralOct$noSkip> = $.loc($.field($.pure("IntegerLiteralOct"), "$", $.right($.str("0"), $.right($.regex<"o">("o", true), $.field($.stry($.right($.regex<string>("0-7", false), $.right($.star($.right($.opt($.str("_")), $.right($.regex<string>("0-7", false), $.eps))), $.eps))), "digits", $.eps)))));
export const idPart: $.Parser<$$.idPart> = $.left($.regex<string | string | "_">("a-z0-9_", true), $.star(space$noSkip));
export const notUnderscore: $.Parser<$$.notUnderscore> = $.left($.str("_"), $.star(space$noSkip));
export const notArithOperator: $.Parser<$$.notArithOperator> = $.alt($.left($.str("+"), $.star(space$noSkip)), $.alt($.left($.str("-"), $.star(space$noSkip)), $.alt($.left($.str("*"), $.star(space$noSkip)), $.alt($.left($.str("/%"), $.star(space$noSkip)), $.alt($.left($.str("/"), $.star(space$noSkip)), $.alt($.left($.str("%"), $.star(space$noSkip)), $.alt($.left($.str("~/"), $.star(space$noSkip)), $.alt($.left($.str("^/"), $.star(space$noSkip)), $.alt($.left($.str("~%"), $.star(space$noSkip)), $.left($.str("^%"), $.star(space$noSkip)))))))))));
export const notComparisonOperator: $.Parser<$$.notComparisonOperator> = $.alt($.left($.str("<=>"), $.star(space$noSkip)), $.alt($.left($.str("<="), $.star(space$noSkip)), $.alt($.left($.str("<"), $.star(space$noSkip)), $.alt($.left($.str(">="), $.star(space$noSkip)), $.alt($.left($.str(">"), $.star(space$noSkip)), $.alt($.left($.str("!="), $.star(space$noSkip)), $.left($.str("=="), $.star(space$noSkip))))))));
export const notBitwiseOperator: $.Parser<$$.notBitwiseOperator> = $.alt($.left($.str("~>>"), $.star(space$noSkip)), $.alt($.left($.str("~"), $.star(space$noSkip)), $.alt($.left($.str("^>>"), $.star(space$noSkip)), $.alt($.left($.str("^"), $.star(space$noSkip)), $.alt($.left($.str("&"), $.star(space$noSkip)), $.alt($.left($.str("|"), $.star(space$noSkip)), $.alt($.left($.str("<<"), $.star(space$noSkip)), $.left($.str(">>"), $.star(space$noSkip)))))))));
export const notAssignOperator: $.Parser<$$.notAssignOperator> = $.alt($.left($.str("="), $.star(space$noSkip)), $.alt($.left($.str("+="), $.star(space$noSkip)), $.alt($.left($.str("-="), $.star(space$noSkip)), $.alt($.left($.str("*="), $.star(space$noSkip)), $.alt($.left($.str("/="), $.star(space$noSkip)), $.alt($.left($.str("%="), $.star(space$noSkip)), $.alt($.left($.str("~>>="), $.star(space$noSkip)), $.alt($.left($.str("~/="), $.star(space$noSkip)), $.alt($.left($.str("~%="), $.star(space$noSkip)), $.alt($.left($.str("^>>="), $.star(space$noSkip)), $.alt($.left($.str("^/="), $.star(space$noSkip)), $.alt($.left($.str("^%="), $.star(space$noSkip)), $.alt($.left($.str("^="), $.star(space$noSkip)), $.alt($.left($.str("<<="), $.star(space$noSkip)), $.alt($.left($.str(">>="), $.star(space$noSkip)), $.alt($.left($.str("&="), $.star(space$noSkip)), $.left($.str("|="), $.star(space$noSkip))))))))))))))))));
export const notDelimiter: $.Parser<$$.notDelimiter> = $.alt($.left($.str("["), $.star(space$noSkip)), $.alt($.left($.str("]"), $.star(space$noSkip)), $.alt($.left($.str("{"), $.star(space$noSkip)), $.alt($.left($.str("}"), $.star(space$noSkip)), $.alt($.left($.str("?"), $.star(space$noSkip)), $.left($.str(":"), $.star(space$noSkip)))))));
export const notControlKeyword: $.Parser<$$.notControlKeyword> = $.alt($.left($.str("return"), $.star(space$noSkip)), $.alt($.left($.str("var"), $.star(space$noSkip)), $.alt($.left($.str("repeat"), $.star(space$noSkip)), $.alt($.left($.str("do"), $.star(space$noSkip)), $.alt($.left($.str("while"), $.star(space$noSkip)), $.alt($.left($.str("until"), $.star(space$noSkip)), $.alt($.left($.str("try"), $.star(space$noSkip)), $.alt($.left($.str("catch"), $.star(space$noSkip)), $.alt($.left($.str("ifnot"), $.star(space$noSkip)), $.alt($.left($.str("if"), $.star(space$noSkip)), $.alt($.left($.str("then"), $.star(space$noSkip)), $.alt($.left($.str("elseifnot"), $.star(space$noSkip)), $.alt($.left($.str("elseif"), $.star(space$noSkip)), $.left($.str("else"), $.star(space$noSkip)))))))))))))));
export const notTypeKeyword: $.Parser<$$.notTypeKeyword> = $.alt($.left($.str("int"), $.star(space$noSkip)), $.alt($.left($.str("cell"), $.star(space$noSkip)), $.alt($.left($.str("builder"), $.star(space$noSkip)), $.alt($.left($.str("slice"), $.star(space$noSkip)), $.alt($.left($.str("cont"), $.star(space$noSkip)), $.alt($.left($.str("tuple"), $.star(space$noSkip)), $.alt($.left($.str("type"), $.star(space$noSkip)), $.alt($.left($.str("->"), $.star(space$noSkip)), $.left($.str("forall"), $.star(space$noSkip))))))))));
export const notKeyword: $.Parser<$$.notKeyword> = $.alt($.left($.str("extern"), $.star(space$noSkip)), $.alt($.left($.str("global"), $.star(space$noSkip)), $.alt($.left($.str("asm"), $.star(space$noSkip)), $.alt($.left($.str("impure"), $.star(space$noSkip)), $.alt($.left($.str("inline_ref"), $.star(space$noSkip)), $.alt($.left($.str("inline"), $.star(space$noSkip)), $.alt($.left($.str("auto_apply"), $.star(space$noSkip)), $.alt($.left($.str("method_id"), $.star(space$noSkip)), $.alt($.left($.str("operator"), $.star(space$noSkip)), $.alt($.left($.str("infixl"), $.star(space$noSkip)), $.alt($.left($.str("infixr"), $.star(space$noSkip)), $.alt($.left($.str("infix"), $.star(space$noSkip)), $.left($.str("const"), $.star(space$noSkip))))))))))))));
export const notDirective: $.Parser<$$.notDirective> = $.alt($.left($.str("#include"), $.star(space$noSkip)), $.left($.str("#pragma"), $.star(space$noSkip)));
export const digit: $.Parser<$$.digit> = $.left($.regex<string>("0-9", false), $.star(space$noSkip));
export const notDecimalNumber: $.Parser<$$.notDecimalNumber> = $.stry($.right($.opt($.left($.str("-"), $.star(space$noSkip))), $.right($.plus(digit), $.eps)));
export const notHexadecimalNumber: $.Parser<$$.notHexadecimalNumber> = $.stry($.right($.opt($.left($.str("-"), $.star(space$noSkip))), $.right($.left($.str("0x"), $.star(space$noSkip)), $.right($.plus(hexDigit), $.eps))));
export const funcInvalidId: $.Parser<$$.funcInvalidId> = $.alt(notUnderscore, $.alt(notArithOperator, $.alt(notComparisonOperator, $.alt(notBitwiseOperator, $.alt(notAssignOperator, $.alt(notDelimiter, $.alt(notControlKeyword, $.alt(notTypeKeyword, $.alt(notKeyword, $.alt(notDirective, $.alt(notDecimalNumber, notHexadecimalNumber)))))))))));
export const notUnderscore$noSkip: $.Parser<$$.notUnderscore$noSkip> = $.str("_");
export const notArithOperator$noSkip: $.Parser<$$.notArithOperator$noSkip> = $.alt($.str("+"), $.alt($.str("-"), $.alt($.str("*"), $.alt($.str("/%"), $.alt($.str("/"), $.alt($.str("%"), $.alt($.str("~/"), $.alt($.str("^/"), $.alt($.str("~%"), $.str("^%"))))))))));
export const notComparisonOperator$noSkip: $.Parser<$$.notComparisonOperator$noSkip> = $.alt($.str("<=>"), $.alt($.str("<="), $.alt($.str("<"), $.alt($.str(">="), $.alt($.str(">"), $.alt($.str("!="), $.str("==")))))));
export const notBitwiseOperator$noSkip: $.Parser<$$.notBitwiseOperator$noSkip> = $.alt($.str("~>>"), $.alt($.str("~"), $.alt($.str("^>>"), $.alt($.str("^"), $.alt($.str("&"), $.alt($.str("|"), $.alt($.str("<<"), $.str(">>"))))))));
export const notAssignOperator$noSkip: $.Parser<$$.notAssignOperator$noSkip> = $.alt($.str("="), $.alt($.str("+="), $.alt($.str("-="), $.alt($.str("*="), $.alt($.str("/="), $.alt($.str("%="), $.alt($.str("~>>="), $.alt($.str("~/="), $.alt($.str("~%="), $.alt($.str("^>>="), $.alt($.str("^/="), $.alt($.str("^%="), $.alt($.str("^="), $.alt($.str("<<="), $.alt($.str(">>="), $.alt($.str("&="), $.str("|=")))))))))))))))));
export const notDelimiter$noSkip: $.Parser<$$.notDelimiter$noSkip> = $.alt($.str("["), $.alt($.str("]"), $.alt($.str("{"), $.alt($.str("}"), $.alt($.str("?"), $.str(":"))))));
export const notControlKeyword$noSkip: $.Parser<$$.notControlKeyword$noSkip> = $.alt($.str("return"), $.alt($.str("var"), $.alt($.str("repeat"), $.alt($.str("do"), $.alt($.str("while"), $.alt($.str("until"), $.alt($.str("try"), $.alt($.str("catch"), $.alt($.str("ifnot"), $.alt($.str("if"), $.alt($.str("then"), $.alt($.str("elseifnot"), $.alt($.str("elseif"), $.str("else"))))))))))))));
export const notTypeKeyword$noSkip: $.Parser<$$.notTypeKeyword$noSkip> = $.alt($.str("int"), $.alt($.str("cell"), $.alt($.str("builder"), $.alt($.str("slice"), $.alt($.str("cont"), $.alt($.str("tuple"), $.alt($.str("type"), $.alt($.str("->"), $.str("forall")))))))));
export const notKeyword$noSkip: $.Parser<$$.notKeyword$noSkip> = $.alt($.str("extern"), $.alt($.str("global"), $.alt($.str("asm"), $.alt($.str("impure"), $.alt($.str("inline_ref"), $.alt($.str("inline"), $.alt($.str("auto_apply"), $.alt($.str("method_id"), $.alt($.str("operator"), $.alt($.str("infixl"), $.alt($.str("infixr"), $.alt($.str("infix"), $.str("const")))))))))))));
export const notDirective$noSkip: $.Parser<$$.notDirective$noSkip> = $.alt($.str("#include"), $.str("#pragma"));
export const digit$noSkip: $.Parser<$$.digit$noSkip> = $.regex<string>("0-9", false);
export const notDecimalNumber$noSkip: $.Parser<$$.notDecimalNumber$noSkip> = $.stry($.right($.opt($.str("-")), $.right($.plus(digit$noSkip), $.eps)));
export const notHexadecimalNumber$noSkip: $.Parser<$$.notHexadecimalNumber$noSkip> = $.stry($.right($.opt($.str("-")), $.right($.str("0x"), $.right($.plus(hexDigit$noSkip), $.eps))));
export const funcInvalidId$noSkip: $.Parser<$$.funcInvalidId$noSkip> = $.alt(notUnderscore$noSkip, $.alt(notArithOperator$noSkip, $.alt(notComparisonOperator$noSkip, $.alt(notBitwiseOperator$noSkip, $.alt(notAssignOperator$noSkip, $.alt(notDelimiter$noSkip, $.alt(notControlKeyword$noSkip, $.alt(notTypeKeyword$noSkip, $.alt(notKeyword$noSkip, $.alt(notDirective$noSkip, $.alt(notDecimalNumber$noSkip, notHexadecimalNumber$noSkip)))))))))));
export const whiteSpace: $.Parser<$$.whiteSpace> = $.left($.regex<" " | "\t" | "\r" | "\n">(" \\t\\r\\n", false), $.star(space$noSkip));
export const funcPlainId: $.Parser<$$.funcPlainId> = $.stry($.right($.lookNeg($.right(funcInvalidId, $.right($.left($.str(")"), $.star(space$noSkip)), $.eps))), $.right($.plus($.right($.lookNeg($.alt(whiteSpace, $.left($.regex<"(" | ")" | "[" | string | "," | "." | ";" | "~">("()[\\],.;~", false), $.star(space$noSkip)))), $.right($.left($.any, $.star(space$noSkip)), $.eps))), $.eps)));
export const whiteSpace$noSkip: $.Parser<$$.whiteSpace$noSkip> = $.regex<" " | "\t" | "\r" | "\n">(" \\t\\r\\n", false);
export const funcPlainId$noSkip: $.Parser<$$.funcPlainId$noSkip> = $.stry($.right($.lookNeg($.right(funcInvalidId$noSkip, $.right($.str(")"), $.eps))), $.right($.plus($.right($.lookNeg($.alt(whiteSpace$noSkip, $.regex<"(" | ")" | "[" | string | "," | "." | ";" | "~">("()[\\],.;~", false))), $.right($.any, $.eps))), $.eps)));
export const funcQuotedId: $.Parser<$$.funcQuotedId> = $.right($.left($.str("`"), $.star(space$noSkip)), $.left($.stry($.plus($.right($.lookNeg($.left($.regex<"`" | "\n">("`\\n", false), $.star(space$noSkip))), $.right($.left($.any, $.star(space$noSkip)), $.eps)))), $.left($.str("`"), $.star(space$noSkip))));
export const funcQuotedId$noSkip: $.Parser<$$.funcQuotedId$noSkip> = $.right($.str("`"), $.left($.stry($.plus($.right($.lookNeg($.regex<"`" | "\n">("`\\n", false)), $.right($.any, $.eps)))), $.str("`")));
export const FuncId: $.Parser<$$.FuncId> = $.loc($.field($.pure("FuncId"), "$", $.right($.lookNeg($.alt($.left($.str("\""), $.star(space$noSkip)), $.left($.str("{-"), $.star(space$noSkip)))), $.field($.opt($.alt($.left($.str("."), $.star(space$noSkip)), $.left($.str("~"), $.star(space$noSkip)))), "accessor", $.field($.alt(funcQuotedId, funcPlainId), "id", $.eps)))));
export const FuncId$noSkip: $.Parser<$$.FuncId$noSkip> = $.loc($.field($.pure("FuncId"), "$", $.right($.lookNeg($.alt($.str("\""), $.str("{-"))), $.field($.opt($.alt($.str("."), $.str("~"))), "accessor", $.field($.alt(funcQuotedId$noSkip, funcPlainId$noSkip), "id", $.eps)))));
export const escapeChar: $.Parser<$$.escapeChar> = $.alt($.left($.regex<"\\" | "\"" | "n" | "r" | "t" | "v" | "b" | "f">("\\\\\"nrtvbf", false), $.star(space$noSkip)), $.alt($.right($.left($.str("u{"), $.star(space$noSkip)), $.left($.stry($.right(hexDigit, $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.right($.opt(hexDigit), $.eps))))))), $.left($.str("}"), $.star(space$noSkip)))), $.alt($.right($.left($.str("u"), $.star(space$noSkip)), $.stry($.right(hexDigit, $.right(hexDigit, $.right(hexDigit, $.right(hexDigit, $.eps)))))), $.right($.left($.str("x"), $.star(space$noSkip)), $.stry($.right(hexDigit, $.right(hexDigit, $.eps)))))));
export const escapeChar$noSkip: $.Parser<$$.escapeChar$noSkip> = $.alt($.regex<"\\" | "\"" | "n" | "r" | "t" | "v" | "b" | "f">("\\\\\"nrtvbf", false), $.alt($.right($.str("u{"), $.left($.stry($.right(hexDigit$noSkip, $.right($.opt(hexDigit$noSkip), $.right($.opt(hexDigit$noSkip), $.right($.opt(hexDigit$noSkip), $.right($.opt(hexDigit$noSkip), $.right($.opt(hexDigit$noSkip), $.eps))))))), $.str("}"))), $.alt($.right($.str("u"), $.stry($.right(hexDigit$noSkip, $.right(hexDigit$noSkip, $.right(hexDigit$noSkip, $.right(hexDigit$noSkip, $.eps)))))), $.right($.str("x"), $.stry($.right(hexDigit$noSkip, $.right(hexDigit$noSkip, $.eps)))))));
export const fun: $.Parser<$$.fun> = $.left($.left($.str("fun"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $let: $.Parser<$$.$let> = $.left($.left($.str("let"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $return: $.Parser<$$.$return> = $.left($.left($.str("return"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const extend: $.Parser<$$.extend> = $.left($.left($.str("extend"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $native: $.Parser<$$.$native> = $.left($.left($.str("native"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const primitive: $.Parser<$$.primitive> = $.left($.left($.str("primitive"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $public: $.Parser<$$.$public> = $.left($.left($.str("public"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $null: $.Parser<$$.$null> = $.left($.left($.str("null"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $if: $.Parser<$$.$if> = $.left($.left($.str("if"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $else: $.Parser<$$.$else> = $.left($.left($.str("else"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $while: $.Parser<$$.$while> = $.left($.left($.str("while"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const repeat: $.Parser<$$.repeat> = $.left($.left($.str("repeat"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $do: $.Parser<$$.$do> = $.left($.left($.str("do"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const until: $.Parser<$$.until> = $.left($.left($.str("until"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $try: $.Parser<$$.$try> = $.left($.left($.str("try"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $catch: $.Parser<$$.$catch> = $.left($.left($.str("catch"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const foreach: $.Parser<$$.foreach> = $.left($.left($.str("foreach"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $as: $.Parser<$$.$as> = $.left($.left($.str("as"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const map: $.Parser<$$.map> = $.left($.left($.str("map"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const mutates: $.Parser<$$.mutates> = $.left($.left($.str("mutates"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $extends: $.Parser<$$.$extends> = $.left($.left($.str("extends"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $import: $.Parser<$$.$import> = $.left($.left($.str("import"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $with: $.Parser<$$.$with> = $.left($.left($.str("with"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const trait: $.Parser<$$.trait> = $.left($.left($.str("trait"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const initOf: $.Parser<$$.initOf> = $.left($.left($.str("initOf"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const override: $.Parser<$$.override> = $.left($.left($.str("override"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $abstract: $.Parser<$$.$abstract> = $.left($.left($.str("abstract"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const virtual: $.Parser<$$.virtual> = $.left($.left($.str("virtual"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const inline: $.Parser<$$.inline> = $.left($.left($.str("inline"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const $const: $.Parser<$$.$const> = $.left($.left($.str("const"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const keyword: $.Parser<$$.keyword> = $.alt(fun, $.alt($let, $.alt($return, $.alt(receive, $.alt(extend, $.alt($native, $.alt(primitive, $.alt($public, $.alt($null, $.alt($if, $.alt($else, $.alt($while, $.alt(repeat, $.alt($do, $.alt(until, $.alt($try, $.alt($catch, $.alt(foreach, $.alt($as, $.alt(map, $.alt(mutates, $.alt($extends, $.alt(external, $.alt($import, $.alt($with, $.alt(trait, $.alt(initOf, $.alt(override, $.alt($abstract, $.alt(virtual, $.alt(inline, $const)))))))))))))))))))))))))))))));
export const reservedWord: $.Parser<$$.reservedWord> = $.left(keyword, $.lookNeg(idPart));
export const fun$noSkip: $.Parser<$$.fun$noSkip> = $.left($.str("fun"), $.lookNeg(idPart$noSkip));
export const $let$noSkip: $.Parser<$$.$let$noSkip> = $.left($.str("let"), $.lookNeg(idPart$noSkip));
export const $return$noSkip: $.Parser<$$.$return$noSkip> = $.left($.str("return"), $.lookNeg(idPart$noSkip));
export const extend$noSkip: $.Parser<$$.extend$noSkip> = $.left($.str("extend"), $.lookNeg(idPart$noSkip));
export const $native$noSkip: $.Parser<$$.$native$noSkip> = $.left($.str("native"), $.lookNeg(idPart$noSkip));
export const primitive$noSkip: $.Parser<$$.primitive$noSkip> = $.left($.str("primitive"), $.lookNeg(idPart$noSkip));
export const $public$noSkip: $.Parser<$$.$public$noSkip> = $.left($.str("public"), $.lookNeg(idPart$noSkip));
export const $null$noSkip: $.Parser<$$.$null$noSkip> = $.left($.str("null"), $.lookNeg(idPart$noSkip));
export const $if$noSkip: $.Parser<$$.$if$noSkip> = $.left($.str("if"), $.lookNeg(idPart$noSkip));
export const $else$noSkip: $.Parser<$$.$else$noSkip> = $.left($.str("else"), $.lookNeg(idPart$noSkip));
export const $while$noSkip: $.Parser<$$.$while$noSkip> = $.left($.str("while"), $.lookNeg(idPart$noSkip));
export const repeat$noSkip: $.Parser<$$.repeat$noSkip> = $.left($.str("repeat"), $.lookNeg(idPart$noSkip));
export const $do$noSkip: $.Parser<$$.$do$noSkip> = $.left($.str("do"), $.lookNeg(idPart$noSkip));
export const until$noSkip: $.Parser<$$.until$noSkip> = $.left($.str("until"), $.lookNeg(idPart$noSkip));
export const $try$noSkip: $.Parser<$$.$try$noSkip> = $.left($.str("try"), $.lookNeg(idPart$noSkip));
export const $catch$noSkip: $.Parser<$$.$catch$noSkip> = $.left($.str("catch"), $.lookNeg(idPart$noSkip));
export const foreach$noSkip: $.Parser<$$.foreach$noSkip> = $.left($.str("foreach"), $.lookNeg(idPart$noSkip));
export const $as$noSkip: $.Parser<$$.$as$noSkip> = $.left($.str("as"), $.lookNeg(idPart$noSkip));
export const map$noSkip: $.Parser<$$.map$noSkip> = $.left($.str("map"), $.lookNeg(idPart$noSkip));
export const mutates$noSkip: $.Parser<$$.mutates$noSkip> = $.left($.str("mutates"), $.lookNeg(idPart$noSkip));
export const $extends$noSkip: $.Parser<$$.$extends$noSkip> = $.left($.str("extends"), $.lookNeg(idPart$noSkip));
export const $import$noSkip: $.Parser<$$.$import$noSkip> = $.left($.str("import"), $.lookNeg(idPart$noSkip));
export const $with$noSkip: $.Parser<$$.$with$noSkip> = $.left($.str("with"), $.lookNeg(idPart$noSkip));
export const trait$noSkip: $.Parser<$$.trait$noSkip> = $.left($.str("trait"), $.lookNeg(idPart$noSkip));
export const initOf$noSkip: $.Parser<$$.initOf$noSkip> = $.left($.str("initOf"), $.lookNeg(idPart$noSkip));
export const override$noSkip: $.Parser<$$.override$noSkip> = $.left($.str("override"), $.lookNeg(idPart$noSkip));
export const $abstract$noSkip: $.Parser<$$.$abstract$noSkip> = $.left($.str("abstract"), $.lookNeg(idPart$noSkip));
export const virtual$noSkip: $.Parser<$$.virtual$noSkip> = $.left($.str("virtual"), $.lookNeg(idPart$noSkip));
export const inline$noSkip: $.Parser<$$.inline$noSkip> = $.left($.str("inline"), $.lookNeg(idPart$noSkip));
export const $const$noSkip: $.Parser<$$.$const$noSkip> = $.left($.str("const"), $.lookNeg(idPart$noSkip));
export const keyword$noSkip: $.Parser<$$.keyword$noSkip> = $.alt(fun$noSkip, $.alt($let$noSkip, $.alt($return$noSkip, $.alt(receive$noSkip, $.alt(extend$noSkip, $.alt($native$noSkip, $.alt(primitive$noSkip, $.alt($public$noSkip, $.alt($null$noSkip, $.alt($if$noSkip, $.alt($else$noSkip, $.alt($while$noSkip, $.alt(repeat$noSkip, $.alt($do$noSkip, $.alt(until$noSkip, $.alt($try$noSkip, $.alt($catch$noSkip, $.alt(foreach$noSkip, $.alt($as$noSkip, $.alt(map$noSkip, $.alt(mutates$noSkip, $.alt($extends$noSkip, $.alt(external$noSkip, $.alt($import$noSkip, $.alt($with$noSkip, $.alt(trait$noSkip, $.alt(initOf$noSkip, $.alt(override$noSkip, $.alt($abstract$noSkip, $.alt(virtual$noSkip, $.alt(inline$noSkip, $const$noSkip)))))))))))))))))))))))))))))));
export const reservedWord$noSkip: $.Parser<$$.reservedWord$noSkip> = $.left(keyword$noSkip, $.lookNeg(idPart$noSkip));
export const contract: $.Parser<$$.contract> = $.left($.left($.str("contract"), $.lookNeg(idPart$noSkip)), $.star(space$noSkip));
export const contract$noSkip: $.Parser<$$.contract$noSkip> = $.left($.str("contract"), $.lookNeg(idPart$noSkip));
export const JustImports: $.Parser<$$.JustImports> = $.loc($.field($.pure("JustImports"), "$", $.field($.star(Import), "imports", $.right($.star($.left($.any, $.star(space$noSkip))), $.eps))));
export const JustImports$noSkip: $.Parser<$$.JustImports$noSkip> = $.loc($.field($.pure("JustImports"), "$", $.field($.star(Import$noSkip), "imports", $.right($.star($.any), $.eps))));