struct OptInt {
    x: Int?;
}
struct OptBool {
    y: Bool?;
}
struct Mix {
    a: OptInt;
    b: OptBool;
}

contract DifferentOptionals {
    m: Mix;
    init() {
        self.m = Mix{
            a:OptInt{x: null},
            b:OptBool{y:null}
        };
    }
}