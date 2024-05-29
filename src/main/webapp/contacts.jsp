<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Liste des Contacts</title>
        <!-- Intégration de Tailwind CSS -->
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-100">
        <div class="container mx-auto p-8">
            <h1 class="text-3xl font-bold mb-8">Liste des Contacts</h1>
            <form action="contacts" method="post" class="mb-8">
                <div class="grid grid-cols-4 gap-4">
                    <div>
                        <label for="nom" class="block text-sm font-bold">Nom:</label>
                        <input type="text" id="nom" name="nom" class="w-full px-3 py-2 border rounded-md">
                    </div>
                    <div>
                        <label for="numeroTelephone" class="block text-sm font-bold">Numéro de Téléphone:</label>
                        <input type="text" id="numeroTelephone" name="numeroTelephone" class="w-full px-3 py-2 border rounded-md">
                    </div>
                    <div>
                        <label for="ville" class="block text-sm font-bold">Ville:</label>
                        <input type="text" id="ville" name="ville" class="w-full px-3 py-2 border rounded-md">
                    </div>
                    <div>
                        <label for="profession" class="block text-sm font-bold">Profession:</label>
                        <input type="text" id="profession" name="profession" class="w-full px-3 py-2 border rounded-md">
                    </div>
                </div>
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 mt-4 rounded-md">Ajouter Contact</button>
            </form>

            <h2 class="text-2xl font-bold mb-4">Contacts</h2>
            <table class="table-auto w-full">
                <thead>
                    <tr>
                        <th class="px-4 py-2 bg-gray-200 text-left">Nom</th>
                        <th class="px-4 py-2 bg-gray-200 text-left">Numéro de Téléphone</th>
                        <th class="px-4 py-2 bg-gray-200 text-left">Ville</th>
                        <th class="px-4 py-2 bg-gray-200 text-left">Profession</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="contact" items="${contacts}">
                        <tr>
                            <td class="border px-4 py-2">${contact.nom}</td>
                            <td class="border px-4 py-2">${contact.numeroTelephone}</td>
                            <td class="border px-4 py-2">${contact.ville}</td>
                            <td class="border px-4 py-2">${contact.profession}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
