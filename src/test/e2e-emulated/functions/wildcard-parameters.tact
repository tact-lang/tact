fun globalAdd(_: Int, _: Int): Int { return 0 }
fun globalAddThreeWildcards(_: Int, _: Int, _: Int): Int { return 0 }
fun globalAddMixedParams(a: Int, _: Int, b: Int): Int { return a + b }
fun globalAddMixedParams2(a: HoldInt, _: Int, b: Int): Int { return a.val + b }

asm fun globalAsmAdd(_: Int, _: Int): Int { ADD }
asm fun globalAsmAddThreeWildcards(_: Int, _: HoldInt, _: Int): Int { DROP ADD }
asm fun globalAsmAddMixedParams(a: Int, _: Int, b: Int): Int { DROP ADD }

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

    get fun contractAddThreeWildcards(): Int { return self.addThreeWildcards(1, HoldInt { val: 2 }, 3) }

    get fun contractAddMixedParams(): Int { return self.addMixedParams(1, 2, HoldInt { val: 3 }) }

    get fun globalAddThreeWildcards(): Int { return globalAddThreeWildcards(1, 2, 3) }

    get fun globalAddMixedParams(): Int { return globalAddMixedParams(1, 2, 3) }

    get fun globalAddMixedParams2(): Int { return globalAddMixedParams2(HoldInt { val: 1 }, 2, 3) }

    get fun globalAsmAddThreeWildcards(): Int { return globalAsmAddThreeWildcards(1, HoldInt { val: 2 }, 3) }

    get fun globalAsmAddMixedParams(): Int { return globalAsmAddMixedParams(1, 2, 3) }
}
