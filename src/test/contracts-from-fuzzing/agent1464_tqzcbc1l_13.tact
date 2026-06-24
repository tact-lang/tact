struct Mix {
    x: Int;
    y: Bool?;
    z: Int?;
    t: Bool;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{ x:1, y:null, z:null, t:true };
    }
}