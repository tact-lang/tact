struct Inner { y: Int = 5; }

contract TestContract {
    data: Inner? = null;
    
    init() {}
    
    get fun get_data(): Inner? {
        return self.data;
    }
}