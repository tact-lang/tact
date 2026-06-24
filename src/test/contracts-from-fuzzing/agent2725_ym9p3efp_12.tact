struct DeepA { x: Int }
struct DeepB { a: DeepA }
struct DeepC { b: DeepB }
struct DeepD { c: DeepC }
struct DeepE { d: DeepD }
struct DeepF { e: DeepE }
struct DeepG { f: DeepF }
struct DeepH { g: DeepG }
struct DeepI { h: DeepH }
struct DeepJ { i: DeepI }

contract DeepOpt {
    val: DeepJ?;

    init() {
        self.val = null;
    }
}