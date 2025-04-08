struct Nested {
    aa: Int;
    bb: Bool;
}

struct MainStruct {
    x: Int;
    y: String?;
    inner: Nested;
    z: Bool?;
}

contract MixOptional {
    data: MainStruct;

    init() {
        self.data = MainStruct{
            x:1, y:null, inner:Nested{aa:2, bb:true}, z:false
        };
    }
}