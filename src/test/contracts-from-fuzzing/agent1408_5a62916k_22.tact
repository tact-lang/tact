struct BooleanWrapper {
    flag1: Bool; 
    flag2: Bool?; 
}

contract TestContract {
    data: BooleanWrapper;

    init() {
        self.data = BooleanWrapper{
            flag1:true,
            flag2:false,
        };
    }
}