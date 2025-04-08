struct Small { a: Int }
struct Big { f1: Int; f2: Int; f3: Int; f4: Int; f5: Int }

contract ChangeStruct {
    s: Small;

    init() {
        self.s = Small{a:1};
        self.s = Small{a:2};
    }
}