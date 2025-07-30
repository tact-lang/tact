struct StringsAndOptions {
    x: String?;
    y: String;
    z: Int?;
}

contract MixStructs {
    val: StringsAndOptions;

    init() {
        self.val = StringsAndOptions{x:null,y:"test",z:null};
    }
}