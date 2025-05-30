struct SMix {
    x: Int;
    y: Bool?;
    z: String;
}

contract SMixContract {
    data: SMix;

    init() {
        self.data = SMix{x:1,y:null,z:"hi"};
    }
}