struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Wrapper {
    pointOpt: Point?;
}

contract OptSerial {
    dat: Wrapper;
    
    init() {
        self.dat = Wrapper{
            pointOpt: Point{x: 7, y: -9}
        };
    }
}
