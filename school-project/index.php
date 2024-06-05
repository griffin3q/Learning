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
    <section  style="display: flex; flex-direction: row;">
        <div class="section-left">
            <table>
                <tr>
                    <th>Nazwisko</th>
                    <th>Imię</th>
                    <th>Marka</th>
                    <th>Model</th>
                    <th>Numer Rej.</th>
                    <th>Data Wyp.</th>
                    <th>Data Zwr</th>
                    <th>Koszt</th>
                </tr>

                <?php
                    $conn = mysqli_connect("127.0.0.1","root","","samochody");
                    $query = "SELECT klienci.IMIE, klienci.NAZWISKO, samochody.MARKA, samochody.MODEL, samochody.NR_REJ, wypozyczenia.DATA_WYP, wypozyczenia.DATA_ZWR, wypozyczenia.KOSZT FROM klienci INNER JOIN wypozyczenia ON klienci.ID_KLI = wypozyczenia.ID_KLI INNER JOIN samochody ON samochody.ID_SAM = wypozyczenia.ID_SAM;";

                    $result = mysqli_query($conn, $query);
                    while ($row = mysqli_fetch_array($result)) {
                        echo"
                            <tr>
                                <td>".$row[1]."</td>
                                <td>".$row[0]."</td>
                                <td>".$row[2]."</td>
                                <td>".$row[3]."</td>
                                <td>".$row[4]."</td>
                                <td>".$row[5]."</td>
                                <td>".$row[6]."</td>
                                <td>".$row[7]."</td>
                            </tr>
                        ";
                    }
                ?>
            </table>                
        </div>
        <div class="lefts" style="display: flex; flex-direction: column;">
            <div class="section-right-1">
                <img src="auto.png" alt="maluch">
            </div>
            <div class="section-right-2">
                <h3 id="bait">Zawsze niskie ceny!</h3>
                <h4>Ilość samochodów w bazie</h4><br>
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
            Autor strony:<br> &copy; Konrad "Griffin" Kamiński
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