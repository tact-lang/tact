struct AWrap { a: Int }
struct BWrap { b: AWrap? }
struct CWrap { c: BWrap }

contract NestedNullRefs {
    d: CWrap;

    init() {
        self.d = CWrap{
            c: BWrap{
                b: null
            }
        };
    }
}