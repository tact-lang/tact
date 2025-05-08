contract TypesTest {
    intVar: Int;                  
    u8Var: Int as uint8;         
    int16Var: Int as int16;      
    coinsVar: Int as coins;      
    boolVar: Bool;               
    addrVar: Address?;           
    cellVar: Cell;               
    sliceVar: Slice;             
    strVar: String;

    init() {
        self.intVar = 1;
        self.u8Var = 2;
        self.int16Var = -3;
        self.coinsVar = 10;
        self.boolVar = true;
        self.addrVar = myAddress();
        self.cellVar = emptyCell();
        self.sliceVar = emptyCell().asSlice();
        self.strVar = "test";
    }
}