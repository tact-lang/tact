// very wide struct of optionals
struct WideOpts {
    o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
    o6: Int?; o7: Int?; o8: Int?; o9: Int?; o10: Int?;
}

contract Test {
    val: WideOpts;

    init() {
        self.val = WideOpts{
            o1:null, o2:1, o3:null, o4:2, o5:null,
            o6:3, o7:null, o8:4, o9:null, o10:5
        };
    }
}