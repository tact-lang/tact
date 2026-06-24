struct SInner { a: Int; }
struct SMid { a: SInner; b: Int; }
struct SOuter { a: SMid; b: Bool; }

contract NestedStructOpt {
    data: SOuter?;

    init() {
        self.data = null;
    }
}