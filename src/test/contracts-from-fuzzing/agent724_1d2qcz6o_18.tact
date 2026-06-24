struct Tuple {
    x: Int;
    y: Bool;
    z: Int;
    t: Bool;
}

contract TestContract {
    data: Tuple;

    init() {
        self.data = Tuple{
            x:10,
            y:true,
            z:20,
            t:false
        };
    }
}