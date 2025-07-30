contract TestFieldAccessFixed {
    f: Int = 0;
    receive() {
         self.f = 84;
         dump(self.f);
    }
}
