struct OptionalsAndDefaults {
    a: Int?; 
    b: Bool = false;
    c: String = "";
    d: Int = 77;
}

contract OptionalsAndDefaultsContract {
    data: OptionalsAndDefaults = OptionalsAndDefaults{a:null,b:false,c:"",d:77};
}