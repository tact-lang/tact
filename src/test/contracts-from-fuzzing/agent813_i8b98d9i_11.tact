struct Levels1 {
    x: Int;
}

struct Levels2 {
    a: Levels1;
    y: Int;
}

struct Levels3 {
    b: Levels2;
    z: Bool;
}

contract MultiLevelStructs {
    data: Levels3;
    
    init() {
        self.data = Levels3{
            b: Levels2{
                a: Levels1{
                    x: 5
                },
                y: 20
            },
            z: true
        };
    }
}