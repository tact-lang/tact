contract AugAssignCorrect {
    var: Int = 10;

    receive() {
         self.var += 5; // expected 15
         dump(self.var);
         self.var -= 3; // expected 12
         dump(self.var);
         self.var *= 2; // expected 24
         dump(self.var);
         self.var /= 2; // expected 12
         dump(self.var);
         self.var %= 5; // expected 2
         dump(self.var);
    }
}
