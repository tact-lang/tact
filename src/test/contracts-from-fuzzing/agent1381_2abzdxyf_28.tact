contract TestContract {
    data1: Int = 1;
    data2: Bool = false;
    data3: Int? = null;
    data4: Bool? = null;
    data5: Int as int16 = 5;
    data6: Int as uint32 = 6;
    
    init() {
        self.data1 = 1;
        self.data2 = false;
        self.data3 = null;
        self.data4 = null;
        self.data5 = 5;
        self.data6 = 6;
    }
}