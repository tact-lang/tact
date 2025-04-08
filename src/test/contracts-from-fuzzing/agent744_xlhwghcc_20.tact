struct S1 { a:Int; b:Bool; }
struct S2 { c:S1; d:String; }
struct S3 { e:S2; f:Int?; }
struct S4 { g:S3; h:Bool?; }

contract TestContract {
    complex: S4;

    init() {
        self.complex = S4{
            g: S3{
                e: S2{
                    c: S1{ a:10, b:true },
                    d: "data"
                },
                f: null
            },
            h: false
        };
    }
}