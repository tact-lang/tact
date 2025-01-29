import { itShouldNotCompile } from "./util";

describe("fail-const-eval", () => {
    itShouldNotCompile({
        testName: "const-eval-div-by-zero",
        errorMessage:
            "Cannot evaluate expression to a constant: divisor expression must be non-zero",
    });
    itShouldNotCompile({
        testName: "const-eval-mod-by-zero",
        errorMessage:
            "Cannot evaluate expression to a constant: divisor expression must be non-zero",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-positive-literal",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-negative-literal",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '-115792089237316195423570985008687907853269984665640564039457584007913129639937' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-add",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-sub",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '-115792089237316195423570985008687907853269984665640564039457584007913129639937' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-mul1",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '231584178474632390847141970017375815706539969331281128078915168015826259279870' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-mul2",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '-231584178474632390847141970017375815706539969331281128078915168015826259279872' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-div",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-ton1",
        errorMessage: `Cannot evaluate expression to a constant: invalid "ton" argument`,
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-ton2",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-pow-1",
        errorMessage: `"pow" builtin called with negative exponent -42`,
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-pow-2",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-pow2-1",
        errorMessage: `"pow2" builtin called with negative exponent -42`,
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-pow2-2",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-shl1",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-shl2",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '-13407807929942597099574024998205846127479365820592393377723561443721764030073546976801874298166903427690031858186486050853753882811946569946433649006084096' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-struct-instance",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-shl-invalid-bits1",
        errorMessage:
            "the number of bits shifted ('257') must be within [0..256] range",
    });
    itShouldNotCompile({
        testName: "const-eval-shl-invalid-bits2",
        errorMessage:
            "the number of bits shifted ('-1') must be within [0..256] range",
    });
    itShouldNotCompile({
        testName: "const-eval-unboxing-null",
        errorMessage: "non-null value expected but got null",
    });
    itShouldNotCompile({
        testName: "const-eval-invalid-address",
        errorMessage:
            "Cannot evaluate expression to a constant: invalid address encoding: FQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N",
    });

    itShouldNotCompile({
        testName: "const-eval-div-by-zero-in-fun",
        errorMessage:
            "Cannot evaluate expression to a constant: divisor expression must be non-zero",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-add-in-fun",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-div-in-fun",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-mul1-in-fun",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '231584178474632390847141970017375815706539969331281128078915168015826259279870' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-mul2-in-fun",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '-231584178474632390847141970017375815706539969331281128078915168015826259279872' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-positive-literal-in-fun",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-negative-literal-in-fun",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '-115792089237316195423570985008687907853269984665640564039457584007913129639937' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-int-overflow-struct-instance-in-fun",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '115792089237316195423570985008687907853269984665640564039457584007913129639936' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-repeat-lower-bound",
        errorMessage:
            "Cannot evaluate expression to a constant: integer '-115792089237316195423570985008687907853269984665640564039457584007913129639937' does not fit into TVM Int type",
    });
    itShouldNotCompile({
        testName: "const-eval-repeat-upper-bound",
        errorMessage:
            "Cannot evaluate expression to a constant: repeat argument '2147483648' must be a number between -2^256 (inclusive) and 2^31 - 1 (inclusive)",
    });
    itShouldNotCompile({
        testName: "const-eval-ascii-overflow",
        errorMessage:
            "Cannot evaluate expression to a constant: ascii string is too long, expected up to 32 bytes, got 33",
    });
    itShouldNotCompile({
        testName: "const-eval-ascii-overflow-2",
        errorMessage:
            "Cannot evaluate expression to a constant: ascii string is too long, expected up to 32 bytes, got 33",
    });
    itShouldNotCompile({
        testName: "const-eval-rawslice-not-hex",
        errorMessage:
            "Cannot evaluate expression to a constant: invalid hex string: hello world",
    });
    itShouldNotCompile({
        testName: "const-eval-rawslice-overflow",
        errorMessage:
            "Cannot evaluate expression to a constant: slice constant is too long, expected up to 1023 bits, got 1024",
    });
    itShouldNotCompile({
        testName: "const-eval-rawslice-overflow-padded",
        errorMessage:
            "Cannot evaluate expression to a constant: slice constant is too long, expected up to 1023 bits, got 1024",
    });
    itShouldNotCompile({
        testName: "const-eval-rawslice-invalid",
        errorMessage:
            "Cannot evaluate expression to a constant: invalid hex string: 4a__",
    });
    itShouldNotCompile({
        testName: "const-eval-ascii-empty",
        errorMessage:
            "Cannot evaluate expression to a constant: ascii string cannot be empty",
    });
    itShouldNotCompile({
        testName: "const-eval-constant-circular-dependency",
        errorMessage:
            "Cannot evaluate expression to a constant: cannot evaluate C as it has circular dependencies: [C -> A -> C]",
    });
    itShouldNotCompile({
        testName: "const-eval-constant-deep-circular-dependency",
        errorMessage:
            "Cannot evaluate expression to a constant: cannot evaluate E as it has circular dependencies: [E -> D -> C -> B -> A -> E]",
    });
    itShouldNotCompile({
        testName: "const-eval-constant-circular-dependency-with-function",
        errorMessage:
            "Cannot evaluate expression to a constant: cannot evaluate C as it has circular dependencies: [C -> A -> foo() -> C]",
    });
    itShouldNotCompile({
        testName: "const-eval-constant-circular-dependency-with-functions",
        errorMessage:
            "Cannot evaluate expression to a constant: cannot evaluate C as it has circular dependencies: [C -> A -> foo() -> bar() -> baz() -> C]",
    });
    itShouldNotCompile({
        testName:
            "const-eval-constant-circular-dependency-with-recursive-function",
        errorMessage:
            "Cannot evaluate expression to a constant: cannot evaluate C as it has circular dependencies: [C -> A -> foo() -> foo() -> foo() -> C]",
    });
    itShouldNotCompile({
        testName:
            "const-eval-constant-circular-dependency-with-deep-recursive-function",
        errorMessage:
            "Cannot evaluate expression to a constant: cannot evaluate C as it has circular dependencies: [C -> A -> foo() -> foo() -> foo() -> ... -> foo() -> foo() -> foo() -> foo() -> C]",
    });
    itShouldNotCompile({
        testName: "const-eval-constant-circular-dependency-self-assignment",
        errorMessage:
            "Cannot evaluate expression to a constant: cannot evaluate A as it has circular dependencies: [A -> A]",
    });

    itShouldNotCompile({
        testName: "const-eval-self-constant-circular-dependency",
        errorMessage:
            "Cannot evaluate expression to a constant: cannot evaluate self.C as it has circular dependencies: [self.C -> self.A -> self.C]",
    });
    itShouldNotCompile({
        testName: "const-eval-self-constant-deep-circular-dependency",
        errorMessage:
            "Cannot evaluate expression to a constant: cannot evaluate self.E as it has circular dependencies: [self.E -> self.D -> self.C -> self.B -> self.A -> self.E]",
    });
    itShouldNotCompile({
        testName:
            "const-eval-self-constant-circular-dependency-self-assignment",
        errorMessage:
            "Cannot evaluate expression to a constant: cannot evaluate self.A as it has circular dependencies: [self.A -> self.A]",
    });
    itShouldNotCompile({
        testName: "const-eval-self-constant-assign-field",
        errorMessage:
            "Cannot evaluate expression to a constant: cannot evaluate non-constant self field access",
    });
    itShouldNotCompile({
        testName: "const-eval-self-constant-with-method-call-in-value",
        errorMessage:
            'Cannot evaluate expression to a constant: calls of "test" are not supported at this moment',
    });
});
