struct Ints {
    i1: Int;
    i2: Int?;
    i3: Int;
    i4: Int?;
}

contract IntVariants {
    x: Ints;
    y: Ints;

    init() {
        self.x = Ints{i1:1,i2:null,i3:3,i4:null};
        self.y = Ints{i1:5,i2:null,i3:7,i4:null};
    }

    receive() {
        self.x = Ints{i1:10,i2:20,i3:30,i4:40};
        self.y = Ints{i1:50,i2:60,i3:70,i4:80};
    }
}