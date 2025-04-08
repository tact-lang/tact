// complex optionals combined with default values
struct ComboDefaults {
    a:Int;
    b:Bool = false;
    c:String = "a";
    d:Int?;
    e:String?;
}

contract DefaultOpt {
    x: ComboDefaults;

    init() {
        self.x = ComboDefaults{
            a:1,
            d:null,
            e:null
        };
    }
}
