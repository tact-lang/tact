struct BigText {
    paragraph: String;
}

contract LargeStringDefault {
    s: BigText = BigText{
        paragraph: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    };

    receive() {
        self.s.paragraph;
    }
}