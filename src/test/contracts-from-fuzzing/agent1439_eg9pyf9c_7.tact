struct Layer1 { a: Int; inner: Layer2; }
struct Layer2 { b: Bool; inner: Layer3; }
struct Layer3 { c: String; inner: Layer4; }
struct Layer4 { d: Int?; inner: Layer5; }
struct Layer5 { e: Bool?; }

contract TestContract {
    data: Layer1;
    
    init() {
        self.data = Layer1{
            a: 1,
            inner: Layer2{
                b: true,
                inner: Layer3{
                    c: "hi",
                    inner: Layer4{
                        d: null,
                        inner: Layer5{ e:true },
                    },
                },
            },
        };
    }
}