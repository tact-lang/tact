struct DefaultOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DefTest {
    val: DefaultOpt;
    init() {
        self.val = DefaultOpt{a:null,b:null,c:null};
    }
}