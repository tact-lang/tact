// Parameterless contract with struct storing everything
struct AllData {
    i: Int;
    s: String;
    o: Int?;
    b: Bool?;
}

contract StructAll {
    x: AllData;

    init() {
        self.x = AllData{ i:1, s:"ok", o:null, b:true };
    }
}