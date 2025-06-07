struct Deep1 { a: Int; b: Bool; }
struct Deep2 { inner: Deep1; flag: Bool; }
struct Deep3 { deeper: Deep2; note: String?; }
struct Deep4 { last: Deep3; check: Bool; }

contract DepthTest {
    field: Deep4;

    init() {
        self.field = Deep4{
            last: Deep3{
                deeper: Deep2{
                    inner: Deep1{a:1, b:true},
                    flag: false
                },
                note: null
            },
            check: true
        };
    }
}