// Large number of optional fields across multiple nested structs
struct Inner1 { a:Int?; b:Bool?; c:String?; }
struct Inner2 { d:Int?; e:Bool?; f:String?; }
struct Container {
    x:Inner1;
    y:Inner2;
    extra:Int;
}
contract TestContract {
    data: Container;

    init() {
        self.data = Container {
            x: Inner1{ a:null, b:true, c:null },
            y: Inner2{ d:5, e:null, f:"hi" },
            extra: 77,
        };
    }
}