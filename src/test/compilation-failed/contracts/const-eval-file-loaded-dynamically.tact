message Message{
    file: String;
}

contract Base {
    receive(m: Message){
        self.reply(
            self.dynamicallyLoadFile(m.file).asComment()
        );
    }

    inline fun dynamicallyLoadFile(filename: String): String{
        return readFile(filename, "binary");
    }
}