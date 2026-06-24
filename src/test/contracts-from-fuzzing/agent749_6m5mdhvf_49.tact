// Struct with many optionals, set null explicitly
struct Opts {
    o1: Int?;
    o2: Int?;
    o3: String?;
    o4: Bool?;
}

contract OptsTest {
    val: Opts;

    init() {
        self.val = Opts{
            o1:null, o2:null, o3:null, o4:null
        };
    }
}