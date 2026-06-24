struct AA { a: Int }
struct BB { b: AA }
struct CC { c: BB }
struct DD { d: CC }
struct EE { e: DD }
struct FF { f: EE }

contract SixDeep {
    val: FF;

    init() {
        self.val = FF{ f: EE{ e: DD{ d: CC{ c: BB{ b: AA{ a: 42 }}}}}};
    }
}