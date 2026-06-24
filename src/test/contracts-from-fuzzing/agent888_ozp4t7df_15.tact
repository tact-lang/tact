struct Composite1 { a: Int; b: Bool; c: String; d: Int?; }
struct Composite2 { e: Bool?; f: String?; g: Composite1; }

contract ComposeTest {
    s: Composite2;

    init() {
        self.s = Composite2{
            e:null,
            f:"hello",
            g:Composite1{a:42,b:true,c:"x",d:null},
        };
    }
}