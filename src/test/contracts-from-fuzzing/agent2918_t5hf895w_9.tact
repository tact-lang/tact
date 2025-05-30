struct Container {
    val1: Int;
    val2: Int;
    val3: Bool;
    val4: Bool?;
    val5: Int?;
    val6: Int;
}

contract TestContract {
    item1: Container;
    item2: Container;
    item3: Container;

    init() {
        self.item1 = Container{val1:1,val2:2,val3:true,val4:null,val5:5,val6:6};
        self.item2 = Container{val1:10,val2:20,val3:false,val4:true,val5:null,val6:60};
        self.item3 = Container{val1:100,val2:200,val3:true,val4:false,val5:500,val6:600};
    }
}