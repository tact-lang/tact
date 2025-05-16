struct BigOptional {
    val1: Int?;
    val2: Bool?;
    val3: String?;
    val4: Int?;
    val5: Bool?;
}

contract OptStructContract {
    data: BigOptional = BigOptional{
        val1:null, val2:true, val3:null, val4:123, val5:false
    };
    receive() {
        let _ = self.data.val4;
    }
}