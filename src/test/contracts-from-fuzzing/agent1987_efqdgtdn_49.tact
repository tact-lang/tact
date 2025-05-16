struct OnlyString {
    s:String;
}

contract StringOnlyContract {
    val:OnlyString;
    init(){
        self.val = OnlyString{s:"hello"};
    }
}