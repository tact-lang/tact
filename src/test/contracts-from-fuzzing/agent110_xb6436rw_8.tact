contract TestOverlap {
    state: Int = 0;
    flag: Int = 0;
    
    receive("inc") {
         self.state = self.state + 1;
         self.flag = 1;
    }
    receive(str: String) {
         self.state = self.state + 100;
         self.flag = 2;
    }
}
