struct Inner1 { a: Int; b: Bool; c: String; }
struct Inner2 { x: Int?; y: Bool?; z: String?; }
struct Wrap {
    one: Inner1;
    two: Inner2;
}

contract MixedWrap {
    data: Wrap;

    init() {
        self.data = Wrap{
            one: Inner1{a:1,b:true,c:"c"},
            two: Inner2{x:null,y:null,z:null},
        };
    }
}
