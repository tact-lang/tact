contract TestGetterLoop2 {
    x: Int = 0;

    init() {
       self.x = 50;
    }

    get fun getX2(): Int {
       let mutA: Int = 0;
       let mutI: Int = 0;
       while (mutI < 5) {
           mutA += 5;
           mutI += 1;
       }
       if (mutA > self.x) {
           return mutA;
       } else {
           return self.x;
       }
    }
}
