contract TestForeach {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(5, 50);
        self.m.set(3, 30);
        self.m.set(10, 100);
        
        let sum: Int = 0;
        foreach (k, v in self.m) {
            sum += k + v;
        }
        dump(sum);
    }
}
