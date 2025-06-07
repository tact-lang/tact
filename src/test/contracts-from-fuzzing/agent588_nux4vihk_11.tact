struct Huge {
    a1: Int = 1; a2: Int = 2; a3: Int = 3; a4: Int = 4; a5: Int = 5;
    b1: Bool = true; b2: Bool = false; b3: Bool = true; b4: Bool = false; b5: Bool = true;
    o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
    c1: String = "x"; c2: String = "x"; c3: String = "x"; c4: String = "x"; c5: String = "x";
}

contract BigState {
    state: Huge;

    init() {
        self.state = Huge{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            b1:true,b2:false,b3:true,b4:false,b5:true,
            o1:null,o2:null,o3:null,o4:null,o5:null,
            c1:"x",c2:"x",c3:"x",c4:"x",c5:"x"
        };
    }

    receive() {
        let _ = self.state.a1 + self.state.a5;
    }
}