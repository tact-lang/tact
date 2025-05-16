contract FuzzLargeStrings {
    s1: String;
    s2: String;
    s3: String;

    init() {
        self.s1 = "🚀🚀🚀 This is a longish unicode string inside s1! 🚀🚀🚀";
        self.s2 = "😊😊😊 Another verbose unicode string stored in s2! 😊😊😊";
        self.s3 = "🔥🔥🔥 Testing string boundaries with this third text! 🔥🔥🔥";
    }
}