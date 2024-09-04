import { __DANGER_resetNodeId } from "../../grammar/ast";
import { itShouldNotCompile } from "./util";

describe("fail-const-eval", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

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
            "Cannot evaluate expression to a constant: the number of bits shifted ('257') must be within [0..256] range",
    });
    itShouldNotCompile({
        testName: "const-eval-shl-invalid-bits2",
        errorMessage:
            "Cannot evaluate expression to a constant: the number of bits shifted ('-1') must be within [0..256] range",
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
            "Cannot evaluate expression to a constant: repeat argument must be a number between -2^256 (inclusive) and 2^31 - 1 (inclusive)",
    });
    itShouldNotCompile({
        testName: "const-eval-ascii-overflow",
        errorMessage:
            "Cannot evaluate expression to a constant: ascii string is too long, expected up to 32 characters, got 33",
    });
    itShouldNotCompile({
        testName: "const-eval-rawslice-not-hex",
        errorMessage:
            "Cannot evaluate expression to a constant: invalid hex string: hello world",
    });
    itShouldNotCompile({
        testName: "const-eval-ascii-empty",
        errorMessage:
            "Cannot evaluate expression to a constant: ascii string cannot be empty",
    });
});
