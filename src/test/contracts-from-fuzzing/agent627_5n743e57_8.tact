struct SLevel1 { a: Int }
struct SLevel2 { b: SLevel1 }
struct SLevel3 { c: SLevel2 }
struct SLevel4 { d: SLevel3 }
struct SLevel5 { e: SLevel4 }
struct SLevel6 { f: SLevel5 }
struct SLevel7 { g: SLevel6 }
struct SLevel8 { h: SLevel7 }

contract EightNest {
    val: SLevel8;
    init() {
        self.val = SLevel8{ h: SLevel7{ g: SLevel6{ f: SLevel5{ e: SLevel4{ d: SLevel3{ c: SLevel2{ b: SLevel1{ a: 7 } } } } } } } };
    }
}
