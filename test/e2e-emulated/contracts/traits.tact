trait Animal {
    abstract fun getType(): String;
    abstract fun getSound(): String;

    get fun say(): String {
        return beginString()
          .concat("I am a ")
          .concat(self.getType())
          .concat(" and I say ")
          .concat(self.getSound())
          .toString();
    }
    receive("make sound") {
        self.reply(self.say().asComment());
    }
}

trait Dog with Animal {
    override fun getType(): String {
        return "Dog";
    }
    override fun getSound(): String {
        return "Woof";
    }
}

trait Laika with Dog {
    override fun getType(): String {
        return "Laika";
    }
    receive() {
        // deploy
    }
}

contract LaikaContract with Laika {
    // empty contract, we just inherit everything from the traits
}

