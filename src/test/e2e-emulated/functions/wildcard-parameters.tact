fun globalAdd(_: Int, _: Int): Int { return 0 }
fun globalAddThreeWildcards(_: Int, _: Int, _: Int): Int { return 0 }
fun globalAddMixedParams(a: Int, _: Int, b: Int): Int { return a + b }
fun globalAddMixedParams2(a: HoldInt, _: Int, b: Int): Int { return a.val + b }
fun globalAddMixedParams3(a: HoldInt, _: Int, b: Int, _: HoldInt): Int { return a.val + b }

asm fun globalAsmAdd(_: Int, _: Int): Int { ADD }
asm fun globalAsmAddThreeWildcards(_: Int, _: HoldInt, _: Int): Int { DROP ADD }
asm fun globalAsmAddMixedParams(a: Int, _: Int, b: Int): Int { DROP ADD }
asm fun globalAsmAddMixedParams2(a: Int, _: Int, b: Int, _: HoldInt): Int { DROP DROP ADD }

struct HoldInt {
    val: Int;
}

contract Test {
    receive() {}

    fun add(_: Int, _: Int): Int {
        return 0;
    }

    get fun contractAdd(): Int { return self.add(1, 2) }

    get fun globalAdd(): Int { return globalAdd(1, 2) }

    get fun globalAsmAdd(): Int { return globalAsmAdd(1, 2) }

    fun addThreeWildcards(_: Int, _: HoldInt, _: Int): Int { return 0 }

    fun addMixedParams(a: Int, _: Int, b: HoldInt): Int { return a + b.val }

    fun addMixedParams2(a: Int, _: Int, b: HoldInt, _: Int): Int { return a + b.val }

    get fun contractAddThreeWildcards(): Int { return self.addThreeWildcards(1, HoldInt { val: 2 }, 3) }

    get fun contractAddMixedParams(): Int { return self.addMixedParams(1, 2, HoldInt { val: 3 }) }

    get fun contractAddMixedParams2(): Int { return self.addMixedParams2(1, 2, HoldInt { val: 3 }, 10) }

    get fun globalAddThreeWildcards(): Int { return globalAddThreeWildcards(1, 2, 3) }

    get fun globalAddMixedParams(): Int { return globalAddMixedParams(1, 2, 3) }

    get fun globalAddMixedParams2(): Int { return globalAddMixedParams2(HoldInt { val: 1 }, 2, 3) }

    get fun globalAddMixedParams3(): Int { return globalAddMixedParams3(HoldInt { val: 1 }, 2, 3, HoldInt { val: 10 }) }

    get fun globalAsmAddThreeWildcards(): Int { return globalAsmAddThreeWildcards(1, HoldInt { val: 2 }, 3) }

    get fun globalAsmAddMixedParams(): Int { return globalAsmAddMixedParams(1, 2, 3) }

    get fun globalAsmAddMixedParams2(): Int { return globalAsmAddMixedParams2(1, 2, 3, HoldInt { val: 10 }) }
}
