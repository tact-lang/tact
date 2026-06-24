// optional field with complex default
struct DefaultsComplex {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    val: DefaultsComplex = DefaultsComplex{ x:null, y:true, z:null };

    init() {
        self.val = DefaultsComplex{ x:5, y:false, z:"test" };
    }
}