struct AAA { a: Int }
struct BBB { b: AAA }
struct CCC { c: BBB }
struct DDD { d: CCC }
struct EEE { e: DDD }

contract FiveDeep {
    val: EEE;

    init() {
        self.val = EEE{ e: DDD{ d: CCC{ c: BBB{ b: AAA{ a: 7 }}}}};
    }
}