struct ManyOptionals { o1: Int?; o2: Bool?; o3: String?; o4: Int?; o5: Bool?; }

contract OptionalsFields {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{ o1:null, o2:null, o3:null, o4:null, o5:null };
    }
}