contract TestContract {
    fun concatenateStrings(): String {
        let builder: StringBuilder = beginString();
        builder.append("Hello");
        builder.append(", ");
        builder.append("Tact!");
        return builder.toString();
    }
}