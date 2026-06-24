contract Test3 {
    fun concatenateStrings(): String {
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", ");
        sb.append("Tact!");
        return sb.toString();
    }
}