<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wypożyczalnia samochodów</title>

    <link rel="stylesheet" href="styls.css">
</head>
<body>
    <div class="banner">
        <img src="logo.png" alt="nasze logo">
    </div>
    <div class="nav">
        <h1>Wypożyczalnia samochodów</h1>
        <table>
            <tr>
                <td>
                    <a href="index.php">Strona główna</a>
                </td>
                <td>
                    <a href="dodaj.php">Dodaj wypożyczenie</a>
                </td>
            </tr>
        </table>
    </div>
    <section style="display: flex; flex-direction: row;">
        <div class="section-left">
            <form action="dodaj.php" method="post">
            <table><tr>
                    <td>ID Klienta</td>
                    <td><input type="number" name="id-klienta"></td>
                </tr>
                <tr>
                    <td>ID Samochodu</td>
                    <td><input type="number" name="id-sam"></td>
                </tr>
                <tr>
                    <td>Data wypożyczania</td>
                    <td><input type="date" name="data-wypo"></td>
                </tr>
                <tr>
                    <td>Data zwrotu</td>
                    <td><input type="date" name="data-zwr"></td>
                </tr>
                <tr>
                    <td>Koszt</td>
                    <td><input type="number" name="koszt"></td>
                </tr>              
                <tr>
                    <td><input style="width: 100%;" type="reset" value="Czyść"></td>
                    <td><input style="width: 100%;" type="submit" value="Wstaw"></td>
                </tr></table>
                <?php
                    if(isset($_POST["submit"])){
                        $id_kli=$_POST["id-klienta"];
                        $id_sam=$_POST["id-sam"];
                        $data_wyp = $_POST["data-wypo"];
                        $data_zwr = $_POST["data-zwr"];
                        $koszt = $_POST["koszt"];
                        $conn = mysqli_connect("127.0.0.1","root","","samochody");                                      //Fix this
                        $query = "INSERT INTO wypozyczenia (ID_SAM, ID_KLI, DATA_WYP, DATA_ZWR, KOSZT) VALUES ($id_sam, $id_kli, $data_wyp, $data_zwr, $koszt);";
                        $result = mysqli_query($conn, $query);
    
                    }
                ?>
            </form>     
        </div>
        <div class="lefts" style="display: flex; flex-direction: column;">
            <div class="section-right-1">
                <img src="auto.png" alt="maluch">
            </div>
            <div class="section-right-2">
                <h3 id="bait">Zawsze niskie ceny!</h3>
                <h4>Ilość samochodów w bazie</h4>
                <!--TODO-->
                <?php
                    $conn = mysqli_connect("127.0.0.1","root","","samochody");
                    $query = "SELECT COUNT(samochody.ID_SAM) FROM samochody";

                    $result = mysqli_query($conn, $query);
                    while ($row = mysqli_fetch_array($result)) {
                        echo"
                            <p>".$row[0]."</p>
                        ";
                    }
                ?>
            </div>
        </div>
    </section>
    <div class="footers" style="display: flex; flex-direction: row;">
        <div class="footer-1">
            <p>Warszawa</p>
            <p>ul. Wiejska 12</p>
            <p>tel. 123456789</p>
        </div>
        <div class="footer-2">
            Autor strony: <br>&copy; Konrad "Griffin" Kamiński
        </div>
    </div>


    <script>
        var banner =document.getElementById("bait");
        banner.addEventListener("click", (event) => {
            banner.innerText = "Znalazłeś ukryty rabat! Zadzwoń po więcej informacji!"
        });
    </script>
</body>
</html>