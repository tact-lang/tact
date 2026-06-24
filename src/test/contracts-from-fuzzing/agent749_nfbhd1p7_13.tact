contract TestContract {
    long1: Int;
    long2: Int;
    long3: Int;
    long4: Int;
    long5: Int;
    long6: Int;
    long7: Int;
    long8: Int;
    long9: Int;
    long10: Int;
    long11: Int;
    long12: Int;
    long13: Int;
    long14: Int;
    long15: Int;
    long16: Int;
    long17: Int;
    long18: Int;
    long19: Int;
    long20: Int;

    init() {
        self.long1=1;self.long2=2;self.long3=3;self.long4=4;self.long5=5;
        self.long6=6;self.long7=7;self.long8=8;self.long9=9;self.long10=10;
        self.long11=11;self.long12=12;self.long13=13;self.long14=14;self.long15=15;
        self.long16=16;self.long17=17;self.long18=18;self.long19=19;self.long20=20;
    }

    receive() {
        let _ = self.long1;
    }
}