
let nextId = 0

export const createContext = (s: string, space: Rule) => ({
    s,
    p: 0,
    l: s.length,
    space,
});

export type Context = {
    s: string,
    p: number,
    l: number,
    space: undefined | Rule,
}

export type Rule = (ctx: Context, b: Builder, field?: string) => boolean

export type Cst = CstLeaf | CstNode

export type CstLeaf = {
    readonly $: "leaf",
    readonly id: number,
    readonly text: string,
}

export type CstNode = {
    readonly $: "node",
    readonly id: number,
    readonly type: string,
    readonly group: string,
    readonly field: string,
    children: Cst[],
}

export const CstLeaf = (text: string): CstLeaf => ({
    $: "leaf",
    id: nextId++,
    text,
});

export const CstNode = (children: readonly Cst[], type: string = "unknown", field: string = "", group: string = ""): CstNode => {
  if (children.length === 1 && children[0].$ === "node" && children[0].type === "") {
    return CstNode(children[0].children, type, field, group);
  }

  const process = (ch: Cst): readonly Cst[] => {
    if (ch.$ === "node" && ch.type === "") {
      return ch.children.flatMap(ch => process(ch))
    }
    return [ch]
  }

  const processedChildren = children.flatMap(ch => process(ch))

  return {
    $: "node",
    id: nextId++,
    type,
    group,
    field,
    children: processedChildren,
  }
}

const pushGroupTo = (b: Builder, source: Builder, group: string) => {
  if (source.length === 0) return
  b.push(...source.map(it => {
    if (it.$ === "leaf") return it
    return {
      ...it,
      group,
    }
  }))
}

export type Builder = Cst[]

const peek = (ctx: Context): string | undefined => {
    if (ctx.p === ctx.l) return undefined
    return ctx.s[ctx.p]
}

const consumeClass = (ctx: Context, b: Builder, cond: (c: string) => boolean): boolean => {
    if (ctx.p === ctx.l) return false
    const c = ctx.s[ctx.p]
    if (!cond(c)) return false
    ctx.p++;
    const b2: Builder = []
    b2.push(CstLeaf(c))
    skip(ctx, b2)
    if (b2.length > 0) {
        b.push(CstNode(b2, ""))
    }
    return true
}

const consumeString = (ctx: Context, b: Builder, token: string): boolean => {
    if (ctx.s.substring(ctx.p, ctx.p + token.length) !== token) return false
    ctx.p += token.length
    const b2: Builder = []
    b2.push(CstLeaf(token))
    skip(ctx, b2)
    if (b2.length > 0) {
        b.push(CstNode(b2, ""))
    }
    return true
}

export const consumeAny = (ctx: Context, b: Builder) => {
    if (ctx.p === ctx.l) {
        b.push(CstLeaf(""));
        return false;
    }

    const c = ctx.s[ctx.p];
    b.push(CstLeaf(c));
    ctx.p++;
    return true;
};

export const skip = (ctx: Context, b: Builder) => {
    const newCtx = {
        ...ctx,
        space: undefined,
    }
    ctx.space?.(newCtx, b);
    ctx.p = newCtx.p
}

const stringify = (ctx: Context, b: Builder, rule: Rule): boolean => {
    const p = ctx.p
    const r = rule(ctx, b)
    ctx.p = p
    return r
}

const lex = (ctx: Context, b: Builder, rule: Rule): boolean => {
    const newCtx = {
        ...ctx,
        space: undefined,
    }

    return rule(newCtx, b)
}
export const Module: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Module_star_0(ctx, b2, "imports");
  r = r && Module_star_1(ctx, b2, "items");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "Module", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const Import: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "import"))(ctx, b2);
  r = r && StringLiteral(ctx, b2, "path");
  r = r && consumeString(ctx, b2, ";");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "Import", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const moduleItem: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = PrimitiveTypeDecl(ctx, b2);
  r = r || (ctx.p = p, $Function(ctx, b2));
  r = r || (ctx.p = p, AsmFunction(ctx, b2));
  r = r || (ctx.p = p, NativeFunctionDecl(ctx, b2));
  r = r || (ctx.p = p, Constant(ctx, b2));
  r = r || (ctx.p = p, StructDecl(ctx, b2));
  r = r || (ctx.p = p, MessageDecl(ctx, b2));
  r = r || (ctx.p = p, Contract(ctx, b2));
  r = r || (ctx.p = p, Trait(ctx, b2));
  pushGroupTo(b, b2, "moduleItem");
  return r;
};
export const contractItemDecl: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = ContractInit(ctx, b2);
  r = r || (ctx.p = p, Receiver(ctx, b2));
  r = r || (ctx.p = p, $Function(ctx, b2));
  r = r || (ctx.p = p, Constant(ctx, b2));
  r = r || (ctx.p = p, storageVar(ctx, b2));
  pushGroupTo(b, b2, "contractItemDecl");
  return r;
};
export const traitItemDecl: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Receiver(ctx, b2);
  r = r || (ctx.p = p, $Function(ctx, b2));
  r = r || (ctx.p = p, Constant(ctx, b2));
  r = r || (ctx.p = p, storageVar(ctx, b2));
  pushGroupTo(b, b2, "traitItemDecl");
  return r;
};
export const PrimitiveTypeDecl: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "primitive"))(ctx, b2);
  r = r && TypeId(ctx, b2, "name");
  r = r && consumeString(ctx, b2, ";");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "PrimitiveTypeDecl", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const $Function: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = $Function_star_2(ctx, b2, "attributes");
  r = r && keyword((ctx, b) => consumeString(ctx, b, "fun"))(ctx, b2);
  r = r && Id(ctx, b2, "name");
  r = r && ParameterList(Parameter)(ctx, b2, "parameters");
  r = r && $Function_optional_3(ctx, b2, "returnType");
  r = r && $Function_alt_4(ctx, b2, "body");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "$Function", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const FunctionDefinition: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = statements(ctx, b2, "body");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "FunctionDefinition", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const FunctionDeclaration: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const r = semicolon(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "FunctionDeclaration", field ?? ""));
  }
  return r;
};
export const AsmFunction: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "asm");
  r = r && AsmFunction_optional_5(ctx, b2, "shuffle");
  r = r && AsmFunction_star_6(ctx, b2, "attributes");
  r = r && keyword((ctx, b) => consumeString(ctx, b, "fun"))(ctx, b2);
  r = r && Id(ctx, b2, "name");
  r = r && ParameterList(Parameter)(ctx, b2, "parameters");
  r = r && AsmFunction_optional_7(ctx, b2, "returnType");
  r = r && consumeString(ctx, b2, "{");
  r = r && assembly(ctx, b2, "instructions");
  r = r && consumeString(ctx, b2, "}");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "AsmFunction", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const shuffle: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "(");
  r = r && shuffle_star_8(ctx, b2, "ids");
  r = r && shuffle_optional_11(ctx, b2, "to");
  r = r && consumeString(ctx, b2, ")");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const NativeFunctionDecl: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "@name");
  r = r && consumeString(ctx, b2, "(");
  r = r && NativeFunctionDecl_lex_12(ctx, b2, "nativeName");
  r = r && consumeString(ctx, b2, ")");
  r = r && NativeFunctionDecl_star_13(ctx, b2, "attributes");
  r = r && keyword((ctx, b) => consumeString(ctx, b, "native"))(ctx, b2);
  r = r && Id(ctx, b2, "name");
  r = r && ParameterList(Parameter)(ctx, b2, "parameters");
  r = r && NativeFunctionDecl_optional_14(ctx, b2, "returnType");
  r = r && consumeString(ctx, b2, ";");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "NativeFunctionDecl", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const Constant: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Constant_star_15(ctx, b2, "attributes");
  r = r && keyword((ctx, b) => consumeString(ctx, b, "const"))(ctx, b2);
  r = r && Id(ctx, b2, "name");
  r = r && ascription(ctx, b2, "type");
  r = r && Constant_alt_16(ctx, b2, "body");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "Constant", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const ConstantAttribute: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = ConstantAttribute_alt_17(ctx, b2, "name");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "ConstantAttribute", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const ConstantDefinition: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "=");
  r = r && expression(ctx, b2, "expression");
  r = r && semicolon(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "ConstantDefinition", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const ConstantDeclaration: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const r = semicolon(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "ConstantDeclaration", field ?? ""));
  }
  return r;
};
export const storageVar: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = FieldDecl(ctx, b2);
  r = r && semicolon(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StructDecl: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "struct");
  r = r && TypeId(ctx, b2, "name");
  r = r && consumeString(ctx, b2, "{");
  r = r && structFields(ctx, b2, "fields");
  r = r && consumeString(ctx, b2, "}");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StructDecl", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const MessageDecl: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "message");
  r = r && MessageDecl_optional_19(ctx, b2, "opcode");
  r = r && TypeId(ctx, b2, "name");
  r = r && consumeString(ctx, b2, "{");
  r = r && structFields(ctx, b2, "fields");
  r = r && consumeString(ctx, b2, "}");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "MessageDecl", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const structFields: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = structFields_optional_20(ctx, b2);
  r = r && structFields_optional_21(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const FieldDecl: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Id(ctx, b2, "name");
  r = r && ascription(ctx, b2, "type");
  r = r && FieldDecl_optional_23(ctx, b2, "expression");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "FieldDecl", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const Contract: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Contract_star_24(ctx, b2, "attributes");
  r = r && keyword((ctx, b) => consumeString(ctx, b, "contract"))(ctx, b2);
  r = r && Id(ctx, b2, "name");
  r = r && Contract_optional_25(ctx, b2, "parameters");
  r = r && Contract_optional_26(ctx, b2, "traits");
  r = r && consumeString(ctx, b2, "{");
  r = r && Contract_star_27(ctx, b2, "declarations");
  r = r && consumeString(ctx, b2, "}");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "Contract", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const Trait: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Trait_star_28(ctx, b2, "attributes");
  r = r && keyword((ctx, b) => consumeString(ctx, b, "trait"))(ctx, b2);
  r = r && Id(ctx, b2, "name");
  r = r && Trait_optional_29(ctx, b2, "traits");
  r = r && consumeString(ctx, b2, "{");
  r = r && Trait_star_30(ctx, b2, "declarations");
  r = r && consumeString(ctx, b2, "}");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "Trait", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const inheritedTraits: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "with"))(ctx, b2);
  r = r && commaList(Id)(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const ContractInit: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "init");
  r = r && ParameterList(Parameter)(ctx, b2, "parameters");
  r = r && statements(ctx, b2, "body");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "ContractInit", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const ContractAttribute: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "@interface");
  r = r && consumeString(ctx, b2, "(");
  r = r && StringLiteral(ctx, b2, "name");
  r = r && consumeString(ctx, b2, ")");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "ContractAttribute", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const FunctionAttribute: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = FunctionAttribute_alt_31(ctx, b2, "name");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "FunctionAttribute", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const GetAttribute: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "get");
  r = r && GetAttribute_optional_33(ctx, b2, "methodId");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "GetAttribute", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const Receiver: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = ReceiverType(ctx, b2, "type");
  r = r && consumeString(ctx, b2, "(");
  r = r && receiverParam(ctx, b2, "param");
  r = r && consumeString(ctx, b2, ")");
  r = r && statements(ctx, b2, "body");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "Receiver", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const ReceiverType: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = ReceiverType_alt_34(ctx, b2, "name");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "ReceiverType", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const receiverParam: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = receiverParam_optional_36(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const assembly: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const newCtx = {
    ...ctx,
    space: undefined
  };
  const r = assembly_stringify_37(newCtx, b2);
  if (r) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  ctx.p = newCtx.p;
  skip(ctx, b);
  return r;
};
export const assemblySequence: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, assemblyItem(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const assemblyItem: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = assemblyItem_seq_38(ctx, b2);
  r = r || (ctx.p = p, Comment(ctx, b2));
  r = r || (ctx.p = p, assemblyItem_seq_40(ctx, b2));
  r = r || (ctx.p = p, assemblyItem_plus_44(ctx, b2));
  pushGroupTo(b, b2, "assemblyItem");
  return r;
};
export const ascription: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, ":");
  r = r && $type(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const $type: Rule = (ctx, b, field) => {
  return TypeAs(ctx, b, field);
};
export const TypeAs: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = TypeOptional(ctx, b2, "type");
  r = r && TypeAs_star_46(ctx, b2, "as");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "TypeAs", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const TypeOptional: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = typePrimary(ctx, b2, "type");
  r = r && TypeOptional_star_47(ctx, b2, "optionals");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "TypeOptional", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const typePrimary: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = TypeGeneric(ctx, b2);
  r = r || (ctx.p = p, TypeRegular(ctx, b2));
  pushGroupTo(b, b2, "typePrimary");
  return r;
};
export const TypeRegular: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = TypeId(ctx, b2, "child");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "TypeRegular", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const TypeGeneric: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = TypeGeneric_alt_48(ctx, b2, "name");
  r = r && consumeString(ctx, b2, "<");
  r = r && commaList($type)(ctx, b2, "args");
  r = r && consumeString(ctx, b2, ">");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "TypeGeneric", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const MapKeyword: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const r = keyword((ctx, b) => consumeString(ctx, b, "map"))(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "MapKeyword", field ?? ""));
  }
  return r;
};
export const Bounced: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "bounced");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "Bounced", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const TypeId: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = TypeId_lex_52(ctx, b2, "name");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "TypeId", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const statement: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = StatementLet(ctx, b2);
  r = r || (ctx.p = p, StatementDestruct(ctx, b2));
  r = r || (ctx.p = p, StatementBlock(ctx, b2));
  r = r || (ctx.p = p, StatementReturn(ctx, b2));
  r = r || (ctx.p = p, StatementCondition(ctx, b2));
  r = r || (ctx.p = p, StatementWhile(ctx, b2));
  r = r || (ctx.p = p, StatementRepeat(ctx, b2));
  r = r || (ctx.p = p, StatementUntil(ctx, b2));
  r = r || (ctx.p = p, StatementTry(ctx, b2));
  r = r || (ctx.p = p, StatementForEach(ctx, b2));
  r = r || (ctx.p = p, StatementExpression(ctx, b2));
  r = r || (ctx.p = p, StatementAssign(ctx, b2));
  pushGroupTo(b, b2, "statement");
  return r;
};
export const statements: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "{");
  r = r && statements_star_53(ctx, b2);
  r = r && consumeString(ctx, b2, "}");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementLet: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "let"))(ctx, b2);
  r = r && Id(ctx, b2, "name");
  r = r && StatementLet_optional_54(ctx, b2, "type");
  r = r && consumeString(ctx, b2, "=");
  r = r && expression(ctx, b2, "init");
  r = r && semicolon(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementLet", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementDestruct: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "let"))(ctx, b2);
  r = r && TypeId(ctx, b2, "type");
  r = r && consumeString(ctx, b2, "{");
  r = r && inter(destructItem, (ctx, b) => consumeString(ctx, b, ","))(ctx, b2, "fields");
  r = r && optionalRest(ctx, b2, "rest");
  r = r && consumeString(ctx, b2, "}");
  r = r && consumeString(ctx, b2, "=");
  r = r && expression(ctx, b2, "init");
  r = r && semicolon(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementDestruct", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementBlock: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = statements(ctx, b2, "body");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementBlock", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementReturn: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "return"))(ctx, b2);
  r = r && StatementReturn_optional_55(ctx, b2, "expression");
  r = r && semicolon(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementReturn", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementExpression: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = expression(ctx, b2, "expression");
  r = r && semicolon(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementExpression", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementAssign: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = expression(ctx, b2, "left");
  r = r && StatementAssign_optional_56(ctx, b2, "operator");
  r = r && consumeString(ctx, b2, "=");
  r = r && expression(ctx, b2, "right");
  r = r && semicolon(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementAssign", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementCondition: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "if"))(ctx, b2);
  r = r && expression(ctx, b2, "condition");
  r = r && statements(ctx, b2, "trueBranch");
  r = r && StatementCondition_optional_59(ctx, b2, "falseBranch");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementCondition", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementWhile: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "while"))(ctx, b2);
  r = r && parens(ctx, b2, "condition");
  r = r && statements(ctx, b2, "body");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementWhile", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementRepeat: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "repeat"))(ctx, b2);
  r = r && parens(ctx, b2, "condition");
  r = r && statements(ctx, b2, "body");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementRepeat", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementUntil: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "do"))(ctx, b2);
  r = r && statements(ctx, b2, "body");
  r = r && keyword((ctx, b) => consumeString(ctx, b, "until"))(ctx, b2);
  r = r && parens(ctx, b2, "condition");
  r = r && semicolon(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementUntil", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementTry: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "try"))(ctx, b2);
  r = r && statements(ctx, b2, "body");
  r = r && StatementTry_optional_61(ctx, b2, "handler");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementTry", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementForEach: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "foreach"))(ctx, b2);
  r = r && consumeString(ctx, b2, "(");
  r = r && Id(ctx, b2, "key");
  r = r && consumeString(ctx, b2, ",");
  r = r && Id(ctx, b2, "value");
  r = r && consumeString(ctx, b2, "in");
  r = r && expression(ctx, b2, "expression");
  r = r && consumeString(ctx, b2, ")");
  r = r && statements(ctx, b2, "body");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StatementForEach", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const augmentedOp: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "||");
  r = r || (ctx.p = p, consumeString(ctx, b2, "&&"));
  r = r || (ctx.p = p, consumeString(ctx, b2, ">>"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "<<"));
  r = r || (ctx.p = p, consumeClass(ctx, b2, c => c === "-" || c === "+" || c === "*" || c === "/" || c === "%" || c === "|" || c === "&" || c === "^"));
  pushGroupTo(b, b2, "augmentedOp");
  return r;
};
export const FalseBranch: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = statements(ctx, b2, "body");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "FalseBranch", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const semicolon: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, ";");
  r = r || (ctx.p = p, semicolon_lookpos_62(ctx, b2));
  pushGroupTo(b, b2, "semicolon");
  return r;
};
export const destructItem: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = RegularField(ctx, b2);
  r = r || (ctx.p = p, PunnedField(ctx, b2));
  pushGroupTo(b, b2, "destructItem");
  return r;
};
export const RegularField: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Id(ctx, b2, "fieldName");
  r = r && consumeString(ctx, b2, ":");
  r = r && Id(ctx, b2, "varName");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "RegularField", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const PunnedField: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Id(ctx, b2, "name");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "PunnedField", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const optionalRest: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = optionalRest_seq_63(ctx, b2);
  r = r || (ctx.p = p, NoRestArgument(ctx, b2));
  pushGroupTo(b, b2, "optionalRest");
  return r;
};
export const RestArgument: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "..");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "RestArgument", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const NoRestArgument: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, ",");
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "NoRestArgument", field ?? ""));
  }
  return r;
};
export const expression: Rule = (ctx, b, field) => {
  return Conditional(ctx, b, field);
};
export const Conditional: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = or(ctx, b2, "head");
  r = r && Conditional_optional_65(ctx, b2, "tail");
  if (r && b2.length > 0) {
      b.push(CstNode(b2, "Conditional", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const or: Rule = (ctx, b, field) => {
  return Binary(and, (ctx, b) => consumeString(ctx, b, "||"))(ctx, b, field);
};
export const and: Rule = (ctx, b, field) => {
  return Binary(bitwiseOr, (ctx, b) => consumeString(ctx, b, "&&"))(ctx, b, field);
};
export const bitwiseOr: Rule = (ctx, b, field) => {
  return Binary(bitwiseXor, (ctx, b) => consumeString(ctx, b, "|"))(ctx, b, field);
};
export const bitwiseXor: Rule = (ctx, b, field) => {
  return Binary(bitwiseAnd, (ctx, b) => consumeString(ctx, b, "^"))(ctx, b, field);
};
export const bitwiseAnd: Rule = (ctx, b, field) => {
  return Binary(equality, (ctx, b) => consumeString(ctx, b, "&"))(ctx, b, field);
};
export const equality: Rule = (ctx, b, field) => {
  return Binary(compare, equality_alt_66)(ctx, b, field);
};
export const compare: Rule = (ctx, b, field) => {
  return Binary(bitwiseShift, compare_alt_67)(ctx, b, field);
};
export const bitwiseShift: Rule = (ctx, b, field) => {
  return Binary(add, bitwiseShift_alt_68)(ctx, b, field);
};
export const add: Rule = (ctx, b, field) => {
  return Binary(mul, add_alt_69)(ctx, b, field);
};
export const mul: Rule = (ctx, b, field) => {
  return Binary(Unary, (ctx, b) => consumeClass(ctx, b, c => c === "*" || c === "/" || c === "%"))(ctx, b, field);
};
export const Unary: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Unary_star_70(ctx, b2, "prefixes");
  r = r && Suffix(ctx, b2, "expression");
  if (r && b2.length > 0) {
     b.push(CstNode(b2, "Unary", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const Suffix: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = primary(ctx, b2, "expression");
  r = r && Suffix_star_71(ctx, b2, "suffixes");
  if (r && b2.length > 0) {
      b.push(CstNode(b2, "Suffix", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const Binary: (T: Rule, U: Rule) => Rule = (T, U) => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = inter(T, Operator(U))(ctx, b2, "");
    if (r) {
      b.push(CstNode(b2, "Binary", field ?? ""));
    }
    if (!r) {
      ctx.p = p;
    }
    return r;
  };
};
export const Operator: (U: Rule) => Rule = U => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = U(ctx, b2, "name");
    if (r && b2.length > 0) {
      b.push(CstNode(b2, "Operator", field ?? ""));
    }
    if (!r) {
      ctx.p = p;
    }
    return r;
  };
};
export const suffix: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = SuffixUnboxNotNull(ctx, b2);
  r = r || (ctx.p = p, SuffixCall(ctx, b2));
  r = r || (ctx.p = p, SuffixFieldAccess(ctx, b2));
  pushGroupTo(b, b2, "suffix");
  return r;
};
export const SuffixUnboxNotNull: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "!!");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "SuffixUnboxNotNull", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const SuffixCall: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = ParameterList(expression)(ctx, b2, "params");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "SuffixCall", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const SuffixFieldAccess: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, ".");
  r = r && Id(ctx, b2, "name");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "SuffixFieldAccess", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const primary: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Parens(ctx, b2);
  r = r || (ctx.p = p, StructInstance(ctx, b2));
  r = r || (ctx.p = p, IntegerLiteral(ctx, b2));
  r = r || (ctx.p = p, BoolLiteral(ctx, b2));
  r = r || (ctx.p = p, InitOf(ctx, b2));
  r = r || (ctx.p = p, CodeOf(ctx, b2));
  r = r || (ctx.p = p, Null(ctx, b2));
  r = r || (ctx.p = p, StringLiteral(ctx, b2));
  r = r || (ctx.p = p, Id(ctx, b2));
  pushGroupTo(b, b2, "primary");
  return r;
};
export const Null: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const r = keyword((ctx, b) => consumeString(ctx, b, "null"))(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "Null", field ?? ""));
  }
  return r;
};
export const parens: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "(");
  r = r && expression(ctx, b2);
  r = r && consumeString(ctx, b2, ")");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const Parens: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = parens(ctx, b2, "child");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "Parens", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StructInstance: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = TypeId(ctx, b2, "type");
  r = r && StructInstanceFields(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StructInstance", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StructInstanceFields: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "{");
  r = r && StructInstanceFields_optional_72(ctx, b2, "fields");
  r = r && consumeString(ctx, b2, "}");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StructInstanceFields", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const InitOf: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "initOf"))(ctx, b2);
  r = r && Id(ctx, b2, "name");
  r = r && ParameterList(expression)(ctx, b2, "params");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "InitOf", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const CodeOf: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "codeOf");
  r = r && Id(ctx, b2, "name");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "CodeOf", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StructFieldInitializer: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Id(ctx, b2, "name");
  r = r && StructFieldInitializer_optional_74(ctx, b2, "init");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StructFieldInitializer", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const ParameterList: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = consumeString(ctx, b2, "(");
    r = r && ParameterList_optional_75(T)(ctx, b2);
    r = r && consumeString(ctx, b2, ")");
    if (r && b2.length > 0) {
      b.push(CstNode(b2, "ParameterList", field ?? ""));
    }
    if (!r) {
      ctx.p = p;
    }
    return r;
  };
};
export const Parameter: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Id(ctx, b2, "name");
  r = r && ascription(ctx, b2, "type");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "Parameter", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const commaList: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = inter(T, (ctx, b) => consumeString(ctx, b, ","))(ctx, b2);
    r = r && commaList_optional_76(T)(ctx, b2);
    if (r && b2.length > 0) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    if (!r) {
      ctx.p = p;
    }
    return r;
  };
};
export const IntegerLiteral: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = IntegerLiteral_alt_77(ctx, b2, "value");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "IntegerLiteral", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const IntegerLiteralDec: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = IntegerLiteralDec_lex_78(ctx, b2, "digits");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "IntegerLiteralDec", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const IntegerLiteralHex: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = IntegerLiteralHex_lex_80(ctx, b2, "digits");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "IntegerLiteralHex", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const IntegerLiteralBin: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = IntegerLiteralBin_lex_82(ctx, b2, "digits");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "IntegerLiteralBin", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const IntegerLiteralOct: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = IntegerLiteralOct_lex_84(ctx, b2, "digits");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "IntegerLiteralOct", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const underscored: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const p = ctx.p;
    const r = underscored_seq_88(T)(ctx, []);
    if (r) {
      const text = ctx.s.substring(p, ctx.p);
      b.push(CstLeaf(text));
    }
    return r;
  };
};
export const digit: Rule = (ctx, b, field) => {
  return consumeClass(ctx, b, c => c >= "0" && c <= "9");
};
export const idPart: Rule = (ctx, b, field) => {
  return consumeClass(ctx, b, c => c >= "a" && c <= "z" || c >= "A" && c <= "Z" || c >= "0" && c <= "9" || c === "_");
};
export const Id: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Id_lex_93(ctx, b2, "name");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "Id", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const FuncId: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = FuncId_optional_94(ctx, b2, "accessor");
  r = r && FuncId_stringify_99(ctx, b2, "id");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "FuncId", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const BoolLiteral: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = BoolLiteral_alt_100(ctx, b2, "value");
  r = r && BoolLiteral_lookneg_101(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "BoolLiteral", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StringLiteral: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = StringLiteral_lex_107(ctx, b2, "value");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "StringLiteral", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const escapeChar: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeClass(ctx, b2, c => c === "\\" || c === "\"" || c === "n" || c === "r" || c === "t" || c === "v" || c === "b" || c === "f");
  r = r || (ctx.p = p, escapeChar_seq_115(ctx, b2));
  r = r || (ctx.p = p, escapeChar_seq_118(ctx, b2));
  r = r || (ctx.p = p, escapeChar_seq_121(ctx, b2));
  pushGroupTo(b, b2, "escapeChar");
  return r;
};
export const hexDigit: Rule = (ctx, b, field) => {
  return consumeClass(ctx, b, c => c >= "0" && c <= "9" || c >= "a" && c <= "f" || c >= "A" && c <= "F");
};
export const keyword: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const newCtx = {
      ...ctx,
      space: undefined
    };
    const r = keyword_seq_123(T)(newCtx, b2);
    if (r) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    ctx.p = newCtx.p;
    skip(ctx, b);
    return r;
  };
};
export const reservedWord: Rule = (ctx, b, field) => {
  return keyword(reservedWord_alt_124)(ctx, b, field);
};
export const space: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const r = space_alt_128(ctx, b2);
  if (r) {
    let p = ctx.p;
    while (p = ctx.p, space_alt_128(ctx, b2)) {}
    ctx.p = p;
  }
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const Comment: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = multiLineComment(ctx, b2);
  r = r || (ctx.p = p, singleLineComment(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, "Comment", field ?? ""));
  }
  return r;
};
export const multiLineComment: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "/*");
  r = r && multiLineComment_stringify_132(ctx, b2);
  r = r && consumeString(ctx, b2, "*/");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const singleLineComment: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "//");
  r = r && singleLineComment_stringify_134(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const JustImports: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = JustImports_star_135(ctx, b2, "imports");
  r = r && JustImports_star_136(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, "JustImports", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const inter: (A: Rule, B: Rule) => Rule = (A, B) => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = A(ctx, b2, "head");
    r = r && inter_star_138(A, B)(ctx, b2, "tail");
    if (r && b2.length > 0) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    if (!r) {
      ctx.p = p;
    }
    return r;
  };
};
export const Module_star_0: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, Import(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const Module_star_1: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, moduleItem(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const $Function_star_2: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, FunctionAttribute(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const $Function_optional_3: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = ascription(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const $Function_alt_4: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = FunctionDefinition(ctx, b2);
  r = r || (ctx.p = p, FunctionDeclaration(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const AsmFunction_optional_5: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = shuffle(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const AsmFunction_star_6: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, FunctionAttribute(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const AsmFunction_optional_7: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = ascription(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const shuffle_star_8: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, Id(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const shuffle_plus_9: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const r = IntegerLiteralDec(ctx, b2);
  if (r) {
    let p = ctx.p;
    while (p = ctx.p, IntegerLiteralDec(ctx, b2)) {}
    ctx.p = p;
  }
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const shuffle_seq_10: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "->");
  r = r && shuffle_plus_9(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const shuffle_optional_11: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = shuffle_seq_10(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const NativeFunctionDecl_lex_12: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const newCtx = {
    ...ctx,
    space: undefined
  };
  const r = FuncId(newCtx, b2);
  if (r) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  ctx.p = newCtx.p;
  skip(ctx, b);
  return r;
};
export const NativeFunctionDecl_star_13: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, FunctionAttribute(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const NativeFunctionDecl_optional_14: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = ascription(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const Constant_star_15: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, ConstantAttribute(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const Constant_alt_16: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = ConstantDefinition(ctx, b2);
  r = r || (ctx.p = p, ConstantDeclaration(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const ConstantAttribute_alt_17: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "virtual"))(ctx, b2);
  r = r || (ctx.p = p, keyword((ctx, b) => consumeString(ctx, b, "override"))(ctx, b2));
  r = r || (ctx.p = p, keyword((ctx, b) => consumeString(ctx, b, "abstract"))(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const MessageDecl_seq_18: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "(");
  r = r && expression(ctx, b2);
  r = r && consumeString(ctx, b2, ")");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const MessageDecl_optional_19: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = MessageDecl_seq_18(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const structFields_optional_20: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = inter(FieldDecl, (ctx, b) => consumeString(ctx, b, ";"))(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const structFields_optional_21: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, ";");
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const FieldDecl_seq_22: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "=");
  r = r && expression(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const FieldDecl_optional_23: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = FieldDecl_seq_22(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const Contract_star_24: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, ContractAttribute(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const Contract_optional_25: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = ParameterList(Parameter)(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const Contract_optional_26: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = inheritedTraits(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const Contract_star_27: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, contractItemDecl(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const Trait_star_28: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, ContractAttribute(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const Trait_optional_29: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = inheritedTraits(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const Trait_star_30: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, traitItemDecl(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const FunctionAttribute_alt_31: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = GetAttribute(ctx, b2);
  r = r || (ctx.p = p, keyword((ctx, b) => consumeString(ctx, b, "mutates"))(ctx, b2));
  r = r || (ctx.p = p, keyword((ctx, b) => consumeString(ctx, b, "extends"))(ctx, b2));
  r = r || (ctx.p = p, keyword((ctx, b) => consumeString(ctx, b, "virtual"))(ctx, b2));
  r = r || (ctx.p = p, keyword((ctx, b) => consumeString(ctx, b, "override"))(ctx, b2));
  r = r || (ctx.p = p, keyword((ctx, b) => consumeString(ctx, b, "inline"))(ctx, b2));
  r = r || (ctx.p = p, keyword((ctx, b) => consumeString(ctx, b, "abstract"))(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const GetAttribute_seq_32: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "(");
  r = r && expression(ctx, b2);
  r = r && consumeString(ctx, b2, ")");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const GetAttribute_optional_33: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = GetAttribute_seq_32(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const ReceiverType_alt_34: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "bounced");
  r = r || (ctx.p = p, keyword((ctx, b) => consumeString(ctx, b, "receive"))(ctx, b2));
  r = r || (ctx.p = p, keyword((ctx, b) => consumeString(ctx, b, "external"))(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const receiverParam_alt_35: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Parameter(ctx, b2);
  r = r || (ctx.p = p, StringLiteral(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const receiverParam_optional_36: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = receiverParam_alt_35(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const assembly_stringify_37: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = assemblySequence(ctx, []);
  if (r) {
    const text = ctx.s.substring(p, ctx.p);
    b.push(CstLeaf(text));
  }
  return r;
};
export const assemblyItem_seq_38: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "{");
  r = r && assemblySequence(ctx, b2);
  r = r && consumeString(ctx, b2, "}");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const assemblyItem_star_39: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, consumeClass(ctx, b2, c => !(c === "\""))) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const assemblyItem_seq_40: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "\"");
  r = r && assemblyItem_star_39(ctx, b2);
  r = r && consumeString(ctx, b2, "\"");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const assemblyItem_alt_41: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeClass(ctx, b2, c => c === "\"" || c === "{" || c === "}");
  r = r || (ctx.p = p, consumeString(ctx, b2, "//"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "/*"));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const assemblyItem_lookneg_42: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = assemblyItem_alt_41(ctx, b);
  ctx.p = p;
  return !r;
};
export const assemblyItem_seq_43: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = assemblyItem_lookneg_42(ctx, b2);
  r = r && consumeAny(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const assemblyItem_plus_44: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const r = assemblyItem_seq_43(ctx, b2);
  if (r) {
    let p = ctx.p;
    while (p = ctx.p, assemblyItem_seq_43(ctx, b2)) {}
    ctx.p = p;
  }
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const TypeAs_seq_45: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "as"))(ctx, b2);
  r = r && Id(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const TypeAs_star_46: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, TypeAs_seq_45(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const TypeOptional_star_47: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, consumeString(ctx, b2, "?")) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const TypeGeneric_alt_48: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = MapKeyword(ctx, b2);
  r = r || (ctx.p = p, Bounced(ctx, b2));
  r = r || (ctx.p = p, TypeId(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const TypeId_star_49: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, consumeClass(ctx, b2, c => c >= "a" && c <= "z" || c >= "A" && c <= "Z" || c >= "0" && c <= "9" || c === "_")) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const TypeId_seq_50: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeClass(ctx, b2, c => c >= "A" && c <= "Z");
  r = r && TypeId_star_49(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const TypeId_stringify_51: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = TypeId_seq_50(ctx, []);
  if (r) {
    const text = ctx.s.substring(p, ctx.p);
    b.push(CstLeaf(text));
  }
  return r;
};
export const TypeId_lex_52: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const newCtx = {
    ...ctx,
    space: undefined
  };
  const r = TypeId_stringify_51(newCtx, b2);
  if (r) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  ctx.p = newCtx.p;
  skip(ctx, b);
  return r;
};
export const statements_star_53: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, statement(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const StatementLet_optional_54: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = ascription(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const StatementReturn_optional_55: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = expression(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const StatementAssign_optional_56: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = augmentedOp(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const StatementCondition_alt_57: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = FalseBranch(ctx, b2);
  r = r || (ctx.p = p, StatementCondition(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const StatementCondition_seq_58: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "else"))(ctx, b2);
  r = r && StatementCondition_alt_57(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementCondition_optional_59: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = StatementCondition_seq_58(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const StatementTry_seq_60: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = keyword((ctx, b) => consumeString(ctx, b, "catch"))(ctx, b2);
  r = r && consumeString(ctx, b2, "(");
  r = r && Id(ctx, b2, "name");
  r = r && consumeString(ctx, b2, ")");
  r = r && statements(ctx, b2, "body");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StatementTry_optional_61: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = StatementTry_seq_60(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const semicolon_lookpos_62: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = consumeString(ctx, [], "}");
  ctx.p = p;
  return r;
};
export const optionalRest_seq_63: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, ",");
  r = r && RestArgument(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const Conditional_seq_64: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "?");
  r = r && or(ctx, b2, "thenBranch");
  r = r && consumeString(ctx, b2, ":");
  r = r && Conditional(ctx, b2, "elseBranch");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const Conditional_optional_65: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Conditional_seq_64(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const equality_alt_66: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "!=");
  r = r || (ctx.p = p, consumeString(ctx, b2, "=="));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const compare_alt_67: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "<=");
  r = r || (ctx.p = p, consumeString(ctx, b2, "<"));
  r = r || (ctx.p = p, consumeString(ctx, b2, ">="));
  r = r || (ctx.p = p, consumeString(ctx, b2, ">"));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const bitwiseShift_alt_68: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "<<");
  r = r || (ctx.p = p, consumeString(ctx, b2, ">>"));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const add_alt_69: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "+");
  r = r || (ctx.p = p, consumeString(ctx, b2, "-"));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const Unary_star_70: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, Operator((ctx, b) => consumeClass(ctx, b, c => c === "-" || c === "+" || c === "!" || c === "~"))(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const Suffix_star_71: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, suffix(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const StructInstanceFields_optional_72: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = commaList(StructFieldInitializer)(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const StructFieldInitializer_seq_73: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, ":");
  r = r && expression(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StructFieldInitializer_optional_74: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = StructFieldInitializer_seq_73(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const ParameterList_optional_75: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = commaList(T)(ctx, b2);
    r = r || (ctx.p = p, true);
    if (r && b2.length > 0) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    return r;
  };
};
export const commaList_optional_76: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = consumeString(ctx, b2, ",");
    r = r || (ctx.p = p, true);
    if (r && b2.length > 0) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    return r;
  };
};
export const IntegerLiteral_alt_77: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = IntegerLiteralHex(ctx, b2);
  r = r || (ctx.p = p, IntegerLiteralBin(ctx, b2));
  r = r || (ctx.p = p, IntegerLiteralOct(ctx, b2));
  r = r || (ctx.p = p, IntegerLiteralDec(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const IntegerLiteralDec_lex_78: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const newCtx = {
    ...ctx,
    space: undefined
  };
  const r = underscored(digit)(newCtx, b2);
  if (r) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  ctx.p = newCtx.p;
  skip(ctx, b);
  return r;
};
export const IntegerLiteralHex_seq_79: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "0");
  r = r && consumeClass(ctx, b2, c => c === "x" || c === "X");
  r = r && underscored(hexDigit)(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const IntegerLiteralHex_lex_80: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const newCtx = {
    ...ctx,
    space: undefined
  };
  const r = IntegerLiteralHex_seq_79(newCtx, b2);
  if (r) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  ctx.p = newCtx.p;
  skip(ctx, b);
  return r;
};
export const IntegerLiteralBin_seq_81: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "0");
  r = r && consumeClass(ctx, b2, c => c === "b" || c === "B");
  r = r && underscored((ctx, b) => consumeClass(ctx, b, c => c === "0" || c === "1"))(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const IntegerLiteralBin_lex_82: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const newCtx = {
    ...ctx,
    space: undefined
  };
  const r = IntegerLiteralBin_seq_81(newCtx, b2);
  if (r) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  ctx.p = newCtx.p;
  skip(ctx, b);
  return r;
};
export const IntegerLiteralOct_seq_83: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "0");
  r = r && consumeClass(ctx, b2, c => c === "o" || c === "O");
  r = r && underscored((ctx, b) => consumeClass(ctx, b, c => c >= "0" && c <= "7"))(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const IntegerLiteralOct_lex_84: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const newCtx = {
    ...ctx,
    space: undefined
  };
  const r = IntegerLiteralOct_seq_83(newCtx, b2);
  if (r) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  ctx.p = newCtx.p;
  skip(ctx, b);
  return r;
};
export const underscored_optional_85: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = consumeString(ctx, b2, "_");
    r = r || (ctx.p = p, true);
    if (r && b2.length > 0) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    return r;
  };
};
export const underscored_seq_86: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = underscored_optional_85(T)(ctx, b2);
    r = r && T(ctx, b2);
    if (r && b2.length > 0) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    if (!r) {
      ctx.p = p;
    }
    return r;
  };
};
export const underscored_star_87: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    let p = ctx.p;
    while (p = ctx.p, underscored_seq_86(T)(ctx, b2)) {}
    ctx.p = p;
    if (b2.length > 0) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    return true;
  };
};
export const underscored_seq_88: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = T(ctx, b2);
    r = r && underscored_star_87(T)(ctx, b2);
    if (r && b2.length > 0) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    if (!r) {
      ctx.p = p;
    }
    return r;
  };
};
export const Id_lookneg_89: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = reservedWord(ctx, b);
  ctx.p = p;
  return !r;
};
export const Id_star_90: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, idPart(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const Id_seq_91: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = Id_lookneg_89(ctx, b2);
  r = r && consumeClass(ctx, b2, c => c >= "a" && c <= "z" || c >= "A" && c <= "Z" || c === "_");
  r = r && Id_star_90(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const Id_stringify_92: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = Id_seq_91(ctx, []);
  if (r) {
    const text = ctx.s.substring(p, ctx.p);
    b.push(CstLeaf(text));
  }
  return r;
};
export const Id_lex_93: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const newCtx = {
    ...ctx,
    space: undefined
  };
  const r = Id_stringify_92(newCtx, b2);
  if (r) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  ctx.p = newCtx.p;
  skip(ctx, b);
  return r;
};
export const FuncId_optional_94: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeClass(ctx, b2, c => c === "." || c === "~");
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const FuncId_plus_95: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const r = consumeClass(ctx, b2, c => !(c === "`" || c === "\r" || c === "\n"));
  if (r) {
    let p = ctx.p;
    while (p = ctx.p, consumeClass(ctx, b2, c => !(c === "`" || c === "\r" || c === "\n"))) {}
    ctx.p = p;
  }
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const FuncId_seq_96: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "`");
  r = r && FuncId_plus_95(ctx, b2);
  r = r && consumeString(ctx, b2, "`");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const FuncId_plus_97: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const r = consumeClass(ctx, b2, c => !(c === " " || c === "\t" || c === "\r" || c === "\n" || c === "(" || c === ")" || c === "[" || c === "\"\\]\"" || c === "," || c === "." || c === ";" || c === "~"));
  if (r) {
    let p = ctx.p;
    while (p = ctx.p, consumeClass(ctx, b2, c => !(c === " " || c === "\t" || c === "\r" || c === "\n" || c === "(" || c === ")" || c === "[" || c === "\"\\]\"" || c === "," || c === "." || c === ";" || c === "~"))) {}
    ctx.p = p;
  }
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const FuncId_alt_98: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = FuncId_seq_96(ctx, b2);
  r = r || (ctx.p = p, FuncId_plus_97(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const FuncId_stringify_99: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = FuncId_alt_98(ctx, []);
  if (r) {
    const text = ctx.s.substring(p, ctx.p);
    b.push(CstLeaf(text));
  }
  return r;
};
export const BoolLiteral_alt_100: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "true");
  r = r || (ctx.p = p, consumeString(ctx, b2, "false"));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const BoolLiteral_lookneg_101: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = idPart(ctx, b);
  ctx.p = p;
  return !r;
};
export const StringLiteral_seq_102: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "\\");
  r = r && escapeChar(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StringLiteral_alt_103: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeClass(ctx, b2, c => !(c === "\"" || c === "\\"));
  r = r || (ctx.p = p, StringLiteral_seq_102(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const StringLiteral_star_104: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, StringLiteral_alt_103(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const StringLiteral_stringify_105: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = StringLiteral_star_104(ctx, []);
  if (r) {
    const text = ctx.s.substring(p, ctx.p);
    b.push(CstLeaf(text));
  }
  return r;
};
export const StringLiteral_seq_106: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "\"");
  r = r && StringLiteral_stringify_105(ctx, b2);
  r = r && consumeString(ctx, b2, "\"");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const StringLiteral_lex_107: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const newCtx = {
    ...ctx,
    space: undefined
  };
  const r = StringLiteral_seq_106(newCtx, b2);
  if (r) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  ctx.p = newCtx.p;
  skip(ctx, b);
  return r;
};
export const escapeChar_optional_108: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = hexDigit(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const escapeChar_optional_109: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = hexDigit(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const escapeChar_optional_110: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = hexDigit(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const escapeChar_optional_111: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = hexDigit(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const escapeChar_optional_112: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = hexDigit(ctx, b2);
  r = r || (ctx.p = p, true);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const escapeChar_seq_113: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = hexDigit(ctx, b2);
  r = r && escapeChar_optional_108(ctx, b2);
  r = r && escapeChar_optional_109(ctx, b2);
  r = r && escapeChar_optional_110(ctx, b2);
  r = r && escapeChar_optional_111(ctx, b2);
  r = r && escapeChar_optional_112(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const escapeChar_stringify_114: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = escapeChar_seq_113(ctx, []);
  if (r) {
    const text = ctx.s.substring(p, ctx.p);
    b.push(CstLeaf(text));
  }
  return r;
};
export const escapeChar_seq_115: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "u{");
  r = r && escapeChar_stringify_114(ctx, b2);
  r = r && consumeString(ctx, b2, "}");
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const escapeChar_seq_116: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = hexDigit(ctx, b2);
  r = r && hexDigit(ctx, b2);
  r = r && hexDigit(ctx, b2);
  r = r && hexDigit(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const escapeChar_stringify_117: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = escapeChar_seq_116(ctx, []);
  if (r) {
    const text = ctx.s.substring(p, ctx.p);
    b.push(CstLeaf(text));
  }
  return r;
};
export const escapeChar_seq_118: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "u");
  r = r && escapeChar_stringify_117(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const escapeChar_seq_119: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = hexDigit(ctx, b2);
  r = r && hexDigit(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const escapeChar_stringify_120: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = escapeChar_seq_119(ctx, []);
  if (r) {
    const text = ctx.s.substring(p, ctx.p);
    b.push(CstLeaf(text));
  }
  return r;
};
export const escapeChar_seq_121: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "x");
  r = r && escapeChar_stringify_120(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const keyword_lookneg_122: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const p = ctx.p;
    const r = idPart(ctx, b);
    ctx.p = p;
    return !r;
  };
};
export const keyword_seq_123: (T: Rule) => Rule = T => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = T(ctx, b2);
    r = r && keyword_lookneg_122(T)(ctx, b2);
    if (r && b2.length > 0) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    if (!r) {
      ctx.p = p;
    }
    return r;
  };
};
export const reservedWord_alt_124: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = consumeString(ctx, b2, "extend");
  r = r || (ctx.p = p, consumeString(ctx, b2, "public"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "fun"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "let"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "return"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "receive"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "native"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "primitive"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "null"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "if"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "else"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "while"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "repeat"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "do"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "until"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "try"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "catch"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "foreach"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "as"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "map"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "mutates"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "extends"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "external"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "import"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "with"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "trait"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "initOf"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "override"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "abstract"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "virtual"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "inline"));
  r = r || (ctx.p = p, consumeString(ctx, b2, "const"));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const space_plus_125: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const r = consumeClass(ctx, b2, c => c === " " || c === "\t" || c === "\r" || c === "\n");
  if (r) {
    let p = ctx.p;
    while (p = ctx.p, consumeClass(ctx, b2, c => c === " " || c === "\t" || c === "\r" || c === "\n")) {}
    ctx.p = p;
  }
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const space_stringify_126: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = space_plus_125(ctx, []);
  if (r) {
    const text = ctx.s.substring(p, ctx.p);
    b.push(CstLeaf(text));
  }
  return r;
};
export const space_lex_127: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const newCtx = {
    ...ctx,
    space: undefined
  };
  const r = space_stringify_126(newCtx, b2);
  if (r) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  ctx.p = newCtx.p;
  skip(ctx, b);
  return r;
};
export const space_alt_128: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = space_lex_127(ctx, b2);
  r = r || (ctx.p = p, Comment(ctx, b2));
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return r;
};
export const multiLineComment_lookneg_129: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = consumeString(ctx, b, "*/");
  ctx.p = p;
  return !r;
};
export const multiLineComment_seq_130: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  const p = ctx.p;
  let r = multiLineComment_lookneg_129(ctx, b2);
  r = r && consumeAny(ctx, b2);
  if (r && b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  if (!r) {
    ctx.p = p;
  }
  return r;
};
export const multiLineComment_star_131: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, multiLineComment_seq_130(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const multiLineComment_stringify_132: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = multiLineComment_star_131(ctx, []);
  if (r) {
    const text = ctx.s.substring(p, ctx.p);
    b.push(CstLeaf(text));
  }
  return r;
};
export const singleLineComment_star_133: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, consumeClass(ctx, b2, c => !(c === "\r" || c === "\n"))) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const singleLineComment_stringify_134: Rule = (ctx, b, field) => {
  const p = ctx.p;
  const r = singleLineComment_star_133(ctx, []);
  if (r) {
    const text = ctx.s.substring(p, ctx.p);
    b.push(CstLeaf(text));
  }
  return r;
};
export const JustImports_star_135: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, Import(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const JustImports_star_136: Rule = (ctx, b, field) => {
  const b2: Builder = [];
  let p = ctx.p;
  while (p = ctx.p, consumeAny(ctx, b2)) {}
  ctx.p = p;
  if (b2.length > 0) {
    b.push(CstNode(b2, field ?? "", field ?? ""));
  }
  return true;
};
export const inter_seq_137: (A: Rule, B: Rule) => Rule = (A, B) => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    const p = ctx.p;
    let r = B(ctx, b2, "op");
    r = r && A(ctx, b2, "right");
    if (r && b2.length > 0) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    if (!r) {
      ctx.p = p;
    }
    return r;
  };
};
export const inter_star_138: (A: Rule, B: Rule) => Rule = (A, B) => {
  return (ctx, b, field) => {
    const b2: Builder = [];
    let p = ctx.p;
    while (p = ctx.p, inter_seq_137(A, B)(ctx, b2)) {}
    ctx.p = p;
    if (b2.length > 0) {
      b.push(CstNode(b2, field ?? "", field ?? ""));
    }
    return true;
  };
};
