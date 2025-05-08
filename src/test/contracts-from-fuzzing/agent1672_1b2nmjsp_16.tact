// Optional primitive fields mixed direct in contract
contract TestContract {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    
    init() {
        self.optInt = null;
        self.optBool = false;
        self.optString = "hi";
    }
}